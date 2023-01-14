"""Module mail."""
import smtplib
from email import encoders
from email.mime.base import MIMEBase
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText


class MailClient:
    """Client to send email and attach file"""

    def __init__(
        self,
        from_addr: str,
        password: str,
        gmail_url: str = "smtp.gmail.com",
        gmail_port: int = 587,
    ):
        """Initialize session for sending email

        Args:
            from_addr (str): from_addr of sender
            password (str): password of  send]
        """
        self.from_addr = from_addr
        self.gmail_url = gmail_url
        self.gmail_port = gmail_port
        self.message = MIMEMultipart()
        self.password = password
        self.to_addr = ""

        self.session = smtplib.SMTP(self.gmail_url, self.gmail_port)
        self.session.starttls()
        self.session.login(self.from_addr, self.password)

    def __enter__(self):
        """Context manager enter

        Returns:
            _type_: _description_
        """
        return self

    def __exit__(self, *args, **kwargs):
        """Context manager exit."""
        self.session.close()

    def setup_mail(self, to_addr: str, subject: str, mail_content: str):
        """Setup an email.

        Args:
            to_addr (str): the email address to send to.
            subject (str): the subject of the email.
            mail_content (str): the content of the email.
        """
        self.to_addr = to_addr
        self.message["From"] = self.from_addr
        self.message["To"] = to_addr
        self.message["Subject"] = subject
        self.message.attach(MIMEText(mail_content, "plain"))

    def add_attachment(self, attachment_filename: str):
        """Add attachment to email.

        Args:
            attachment_filename (str): the file to be attached.
        """
        with open(attachment_filename, "rb") as attach_file:
            payload = MIMEBase("application", "octate-stream")
            payload.set_payload((attach_file).read())
            encoders.encode_base64(payload)
            payload.add_header(
                "Content-Decomposition",
                "attachment",
                filename=attachment_filename,
            )
            self.message.attach(payload)  # type: ignore

    def send_mail(self):
        """Send mail."""
        text = self.message.as_string()
        self.session.sendmail(
            from_addr=self.from_addr, to_addrs=self.to_addr, msg=text
        )
