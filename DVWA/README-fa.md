<div align="center">

# 🎯 DVWA Setup

### نصب خودکار Damn Vulnerable Web Application

---

</div>

## درباره

اسکریپت نصب خودکار DVWA - یک وب‌اپلیکیشن PHP/MySQL که عمداً آسیب‌پذیر طراحی شده تا متخصصان امنیت بتوانند مهارت‌ها و ابزارهای خود را در یک محیط قانونی تست کنند. عالی برای یادگیری امنیت وب.

---

## تکنولوژی‌ها

![PHP](https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Apache](https://img.shields.io/badge/Apache-D22128?style=for-the-badge&logo=apache&logoColor=white)
![Security](https://img.shields.io/badge/Security-FF0000?style=for-the-badge&logo=security&logoColor=white)

---

## قابلیت‌ها

✅ **نصب خودکار** – راه‌اندازی با یک دستور  
✅ **LAMP Stack کامل** – Apache، MySQL، PHP به صورت خودکار  
✅ **راه‌اندازی دیتابیس** – MySQL به صورت خودکار ساخته و تنظیم می‌شود  
✅ **سطوح امنیتی** – حالت‌های Low، Medium، High، Impossible  
✅ **آماده استفاده** – بلافاصله بعد از نصب قابل دسترسی

---

## نصب

### مرحله ۱: کلون کردن DVWA
```bash
git clone https://github.com/digininja/DVWA.git

### مرحله ۲: دانلود اسکریپت نصب

bash
curl -O https://raw.githubusercontent.com/Anon-Core/AnonSecuritySetup/main/DVWA/dvwa.sh

### مرحله ۳: اجرایی کردن فایل

bash
sudo chmod +x dvwa.sh

### مرحله ۴: اجرای نصب

bash
sudo ./dvwa.sh

---

## بعد از نصب

### دسترسی به DVWA

مرورگر خود را باز کنید و به آدرس زیر بروید:


http://localhost/DVWA

یا اگر از DNS mapping استفاده کردید:


http://dvwa.local

### اطلاعات ورود پیش‌فرض


Username: admin
Password: password

### مراحل اولین ورود

1. روی دکمه **"Create / Reset Database"** کلیک کنید
2. با اطلاعات پیش‌فرض وارد شوید
3. سطح امنیتی را در صفحه **DVWA Security** تنظیم کنید
4. شروع به تمرین کنید!

---

## سطوح امنیتی

| سطح | توضیحات | کاربرد |
|-----|---------|--------|
| **Low** | بدون امنیت | یادگیری آسیب‌پذیری‌های پایه |
| **Medium** | امنیت پایه | تمرین تکنیک‌های bypass |
| **High** | امنیت قوی | exploitation پیشرفته |
| **Impossible** | کد امن | مطالعه امنیت صحیح |

---

## آسیب‌پذیری‌های موجود

- **Brute Force** – شکستن رمز عبور
- **Command Injection** – اجرای دستورات سیستم‌عامل
- **CSRF** – Cross-Site Request Forgery
- **File Inclusion** – حملات LFI/RFI
- **File Upload** – آپلود فایل مخرب
- **SQL Injection** – استثمار دیتابیس
- **XSS** – Cross-Site Scripting (Reflected/Stored/DOM)
- **Weak Session IDs** – پیش‌بینی session
- **Insecure CAPTCHA** – دور زدن CAPTCHA
- **JavaScript** – حملات سمت کلاینت

---

## بررسی نصب

چک کردن اجرای DVWA:

bash
# بررسی وضعیت Apache
sudo systemctl status apache2

# بررسی وضعیت MySQL
sudo systemctl status mysql

# تست دسترسی وب
curl http://localhost/DVWA

---

## پیش‌نیازها

- **سیستم‌عامل:** Ubuntu/Debian Linux
- **RAM:** حداقل 1GB
- **فضای دیسک:** 500MB آزاد
- **شبکه:** اتصال اینترنت برای نصب اولیه
- **دسترسی:** Root یا sudo

---

## رفع مشکل

**نمی‌توانید به DVWA دسترسی پیدا کنید؟**
bash
# ریستارت Apache
sudo systemctl restart apache2

# چک کردن استفاده از پورت 80
sudo netstat -tulpn | grep :80

**خطای اتصال به دیتابیس؟**
bash
# ریستارت MySQL
sudo systemctl restart mysql

# بررسی وضعیت MySQL
sudo systemctl status mysql

**مشکل دسترسی فایل؟**
bash
# تنظیم مجوزهای دایرکتوری DVWA
sudo chown -R www-data:www-data /var/www/html/DVWA
sudo chmod -R 755 /var/www/html/DVWA

**خطاهای PHP؟**
bash
# چک کردن نسخه PHP
php -v

# ریستارت Apache بعد از تغییرات PHP
sudo systemctl restart apache2

---

## فایل‌های تنظیمات

| فایل | کاربرد |
|------|--------|
| `/var/www/html/DVWA/config/config.inc.php` | تنظیمات اصلی |
| `/etc/apache2/sites-available/000-default.conf` | تنظیمات Apache |
| `/etc/php/*/apache2/php.ini` | تنظیمات PHP |

---

## ⚠️ هشدار امنیتی

**هرگز DVWA را روی سرور عمومی یا محیط production نصب نکنید!**

- DVWA **عمداً آسیب‌پذیر** است
- فقط در محیط‌های آزمایشگاهی ایزوله استفاده کنید
- به اینترنت expose نکنید
- از ماشین‌های مجازی یا container استفاده کنید
- فقط روی سیستم‌های خودتان تمرین کنید

---

## حذف نصب

bash
# حذف فایل‌های DVWA
sudo rm -rf /var/www/html/DVWA

# حذف دیتابیس
mysql -u root -p -e "DROP DATABASE dvwa;"

# اختیاری: حذف LAMP stack
sudo apt remove --purge apache2 mysql-server php

---

## منابع یادگیری

- [مستندات رسمی DVWA](https://github.com/digininja/DVWA)
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Web Security Academy](https://portswigger.net/web-security)

---

<div align="center">

[← بازگشت به ریپازیتوری اصلی](../)

</div>


---
