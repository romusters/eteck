"""Function to send mail at a schedule"""
import datetime
import logging

import azure.functions as func

# from src.mail import MailClient


def main(mytimer: func.TimerRequest) -> None:
    """Send mail at a schedule

    Args:
        mytimer (func.TimerRequest): the timer
    """
    utc_timestamp = (
        datetime.datetime.utcnow()
        .replace(tzinfo=datetime.timezone.utc)
        .isoformat()
    )

    if mytimer.past_due:
        logging.info("The timer is past due!")

    logging.info("Python timer trigger function ran at %s", utc_timestamp)
