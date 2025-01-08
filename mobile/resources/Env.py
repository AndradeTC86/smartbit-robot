import os
from dotenv import load_dotenv

load_dotenv()

PLATFORM_NAME = os.getenv('PLATFORM_NAME')
AUTOMATION_NAME= os.getenv('AUTOMATION_NAME')
DEVICE_NAME= os.getenv('DEVICE_NAME')
APP= os.getenv('APP')
AUTO_GRANT_PERMISSIONS= os.getenv('AUTO_GRANT_PERMISSIONS')