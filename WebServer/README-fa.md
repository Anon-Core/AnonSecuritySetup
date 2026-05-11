<div align="center">

# 🌐 نصب وب‌سرور

### نصب خودکار Nginx برای دبیان/اوبونتو

---

</div>

## درباره

این اسکریپت نصب و پیکربندی کامل **وب‌سرور Nginx** را روی سیستم‌های دبیان/اوبونتو به صورت خودکار انجام می‌دهد. شامل تنظیم ریپازیتوری، به‌روزرسانی سیستم، نصب پکیج‌ها و راه‌اندازی سایت تستی روی `127.0.0.1` است.

---

## تکنولوژی‌ها

![Nginx](https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)
![Debian](https://img.shields.io/badge/Debian-A81D33?style=for-the-badge&logo=debian&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)

---

## قابلیت‌ها

✅ **تنظیم میرور ریپازیتوری** – بهینه‌سازی منابع پکیج  
✅ **به‌روزرسانی سیستم** – آپدیت تمام پکیج‌ها به آخرین نسخه  
✅ **نصب Nginx** – نصب و پیکربندی Nginx  
✅ **فعال‌سازی سرویس** – راه‌اندازی خودکار Nginx هنگام بوت  
✅ **سایت تستی** – ایجاد صفحه پیش‌فرض روی `127.0.0.1`

---

## نصب

### مرحله ۱: دانلود اسکریپت
```bash
curl -O https://raw.githubusercontent.com/Anon-Core/AnonSecuritySetup/main/WebServer/setup.sh

### مرحله ۲: اجرایی کردن فایل

bash
sudo chmod +x setup.sh

### مرحله ۳: اجرای اسکریپت

bash
sudo ./setup.sh

---

## بررسی نصب

بعد از نصب، وضعیت Nginx را چک کنید:

bash
# بررسی وضعیت سرویس
sudo systemctl status nginx

# تست در مرورگر
# باز کنید: http://127.0.0.1

باید صفحه خوش‌آمدگویی پیش‌فرض Nginx را ببینید.

---

## پیش‌نیازها

- **سیستم‌عامل:** دبیان ۱۰+ یا اوبونتو ۱۸.۰۴+
- **دسترسی:** Root یا sudo
- **اینترنت:** اتصال فعال برای دانلود پکیج‌ها

---

## رفع مشکل

**Nginx استارت نمی‌شود؟**
bash
sudo systemctl restart nginx
sudo journalctl -u nginx -n 50

**پورت ۸۰ در حال استفاده است؟**
bash
sudo lsof -i :80
# سرویس مزاحم را متوقف کنید یا پورت Nginx را تغییر دهید

---

## ⚠️ نکته امنیتی

این نصب برای **توسعه و تست محلی** است. برای استفاده production، SSL، فایروال و تنظیمات امنیتی را پیکربندی کنید.

---

<div align="center">

[← بازگشت به ریپازیتوری اصلی](../)

</div>


---

