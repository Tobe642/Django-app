"""
Django settings for itapps project.

Generated by 'django-admin startproject' using Django 5.1.2.

For more information on this file, see
https://docs.djangoproject.com/en/5.1/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/5.1/ref/settings/
"""

from pathlib import Path
import os

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/5.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = os.environ.get('SECRET_KEY', 'Power2020')
WEBSITE_HOSTNAME = os.environ.get('WEBSITE_HOSTNAME', None)
DEBUG = WEBSITE_HOSTNAME == None

if DEBUG:

    ALLOWED_HOSTS = []
else:
    ALLOWED_HOSTS = [WEBSITE_HOSTNAME]

CSRF_TRUSTED_ORIGINS = [f'https://{WEBSITE_HOSTNAME}']

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'itreporting',
    'users.apps.UsersConfig',
    'crispy_forms',
    'crispy_bootstrap4',   
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'itapps.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'itapps.wsgi.application'


# Database
# https://docs.djangoproject.com/en/5.1/ref/settings/#databases

DATABASES = {
    'default': {
    'ENGINE': 'django.db.backends.mysql',
    'NAME': os.environ['AZURE_DB_NAME'],
    'HOST': os.environ['AZURE_DB_HOST'],
    'PORT': os.environ['AZURE_DB_PORT'],
    'USER': os.environ['AZURE_DB_USER'],
    'PASSWORD': os.environ['AZURE_DB_PASSWORD'],
    }
}

# Password validation
# https://docs.djangoproject.com/en/5.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/5.1/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/5.1/howto/static-files/

# STATIC_URL = 'static/'
# MEDIA_ROOT = BASE_DIR / 'media'
# MEDIA_URL = '/media/'
AZURE_SA_NAME = os.environ['AZURE_SA_NAME']
AZURE_SA_KEY = os.environ['AZURE_SA_KEY']
STORAGES = {
    "default": {
    "BACKEND": "storages.backends.azure_storage.AzureStorage",
    "OPTIONS": {
    "account_name": AZURE_SA_NAME,
    "account_key": AZURE_SA_KEY,
    "azure_container": "media",
    },
},
    "staticfiles": {
    "BACKEND": "storages.backends.azure_storage.AzureStorage",
    "OPTIONS": {
    "account_name": AZURE_SA_NAME,
    "account_key": AZURE_SA_KEY,
    "azure_container": "static",
    },
},
}
STATIC_URL = f'https://{AZURE_SA_NAME}.blob.core.windows.net/static/'
MEDIA_URL = f'https://{AZURE_SA_NAME}.blob.core.windows.net/media/'
# Default primary key field type
# https://docs.djangoproject.com/en/5.1/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

CRISPY_ALLOWED_TEMPLATE_PACKS = 'bootstrap4'
CRISPY_TEMPLATE_PACK = 'bootstrap4'

LOGIN_REDIRECT_URL = 'itreporting:home'
LOGIN_URL = 'login'
LOGIN_URL = 'itreporting:home'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'djangodb',
        'USER': 'root',
        'PASSWORD': 'Power2020',
        'HOST': 'localhost',  # Use 'localhost' if MySQL is running locally
        'PORT': '3306',       # Default MySQL port
    }
}
