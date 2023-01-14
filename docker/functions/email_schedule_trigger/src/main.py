"""Main module"""
import os

from mail import MailClient

FROM_ADDR = str(os.getenv("FROM_ADDR"))
PASSWORD = str(os.getenv("PASSWORD"))

ATTACHMENT_FILENAME = "resources/test.jpg"
N_DAYS = 1
MAIL_CONTENT = f"\
    Beste lezer(es), \n\
    inmiddels is het {N_DAYS} geleden dat ik u een mail heb gestuurd."
TO_ADDR = "romusters+1@gmail.com"
SUBJECT = "Testmail"

with MailClient(from_addr=FROM_ADDR, password=PASSWORD) as mailClient:
    mailClient.setup_mail(
        to_addr=TO_ADDR, subject=SUBJECT, mail_content=MAIL_CONTENT
    )
    mailClient.add_attachment(attachment_filename=ATTACHMENT_FILENAME)
    mailClient.send_mail()
