from api_v2.indy.credential import Credential, CredentialManager

from tob_api.celery import app as celery
import logging

logger = logging.getLogger(__name__)


@celery.task(ignore_result=True)
def process_credential(cred_data, cred_req_metadata, cred_id):
    logger.info("Processing credential: {}".format(cred_id))
    credential = Credential(cred_data)
    credential_manager = CredentialManager(
        credential, cred_req_metadata
    )
    credential_manager.process(cred_id)
