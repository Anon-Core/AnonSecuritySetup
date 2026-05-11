<div align="center">

# 🌍 DNS Mapping

### ابزار تغییر رکوردهای DNS محلی

---

</div>

## درباره

این اسکریپت فایل `/etc/hosts` محلی را تغییر می‌دهد تا دامنه‌های سفارشی را به آدرس IP مشخص متصل کند. ضروری برای محیط‌های توسعه محلی، تست و تحقیقات امنیتی.

---

## تکنولوژی‌ها

![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![DNS](https://img.shields.io/badge/DNS-0078D4?style=for-the-badge&logo=cloudflare&logoColor=white)

---

## قابلیت‌ها

✅ **اتصال دامنه سفارشی** – هر دامنه را به هر IP متصل کنید  
✅ **تغییر DNS محلی** – دور زدن DNS خارجی  
✅ **محیط توسعه** – تست سایت‌ها قبل از انتشار  
✅ **تست امنیتی** – ریدایرکت دامنه‌ها برای penetration testing  
✅ **بکآپ خودکار** – حفظ فایل اصلی `/etc/hosts`

---

## نصب

### مرحله ۱: دانلود اسکریپت
```bash
curl -O https://raw.githubusercontent.com/Anon-Core/AnonSecuritySetup/main/DNSMapping/dnsmapping.sh

### مرحله ۲: اجرایی کردن فایل

bash
sudo chmod +x dnsmapping.sh

### مرحله ۳: اجرا با پارامترها

bash
sudo ./dnsmapping.sh -dnsmapping -u http://example.com -i 192.168.1.100

---

## نحوه استفاده

### ساختار دستور

bash
sudo ./dnsmapping.sh -dnsmapping -u <URL> -i <IP_ADDRESS>

### پارامترها

| پارامتر | توضیحات | مثال |
|---------|---------|------|
| `-dnsmapping` | فعال‌سازی حالت DNS mapping | فلگ اجباری |
| `-u` | URL/دامنه هدف | `http://test.local` |
| `-i` | آدرس IP مقصد | `127.0.0.1` |

---

## مثال‌ها

### اتصال دامنه محلی

bash
sudo ./dnsmapping.sh -dnsmapping -u http://myapp.local -i 127.0.0.1

### اتصال به سرور خارجی

bash
sudo ./dnsmapping.sh -dnsmapping -u http://target.com -i 10.0.0.50

### اتصال DVWA برای تست

bash
sudo ./dnsmapping.sh -dnsmapping -u http://dvwa.local -i 127.0.0.1

---

## بررسی نصب

چک کردن موفقیت‌آمیز بودن mapping:

bash
# مشاهده فایل hosts
cat /etc/hosts

# تست DNS resolution
ping example.com

# تست در مرورگر
curl http://example.com

---

## پیش‌نیازها

- **سیستم‌عامل:** لینوکس (هر توزیعی)
- **دسترسی:** Root یا sudo
- **دسترسی فایل:** مجوز نوشتن روی `/etc/hosts`

---

## رفع مشکل

**تغییرات اعمال نمی‌شود؟**
bash
# پاک کردن کش DNS (اوبونتو/دبیان)
sudo systemd-resolve --flush-caches

# ریستارت سرویس شبکه
sudo systemctl restart NetworkManager

**خطای Permission denied؟**
bash
# مطمئن شوید از sudo استفاده می‌کنید
sudo ./dnsmapping.sh -dnsmapping -u http://test.com -i 127.0.0.1

---

## ⚠️ نکات مهم

- **بکآپ:** اسکریپت قبل از تغییر، خودکار از `/etc/hosts` بکآپ می‌گیرد
- **ماندگاری:** تغییرات بعد از ریبوت باقی می‌مانند
- **حذف:** برای حذف mapping، دستی `/etc/hosts` را ویرایش کنید
- **فقط تست:** فقط روی سیستم‌هایی که مالک آن هستید استفاده کنید

---

## بازگردانی فایل اصلی

bash
# اگر بکآپ وجود دارد
sudo cp /etc/hosts.backup /etc/hosts

# یا ویرایش دستی
sudo nano /etc/hosts

---

<div align="center">

[← بازگشت به ریپازیتوری اصلی](../)

</div>


---
