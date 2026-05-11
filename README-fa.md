<div align="center">

# 🔐 AnonSecuritySetup

### دوره مبانی هک و امنیت وب

---

</div>

## درباره این ریپازیتوری

این ریپازیتوری شامل **اسکریپت‌های Setup** و **ابزارهای اتوماسیون** برای دوره **مبانی هک و امنیت وب** است. برای **تمرین**، **یادگیری** و **ساخت رزومه** ایجاد شده و شامل تنظیمات محیط و ابزارهای تست امنیتی می‌باشد.

---

## 🛠️ ابزارهای موجود

### 1. [نصب وب‌سرور](./WebServer/)
نصب و پیکربندی خودکار وب‌سرور Nginx برای سیستم‌های دبیان/اوبونتو.

**قابلیت‌ها:**
- تنظیم میرور ریپازیتوری
- به‌روزرسانی سیستم و پیش‌نیازها
- نصب و فعال‌سازی Nginx
- سایت تستی پیش‌فرض روی `127.0.0.1`

---

### 2. [DNS Mapping](./DNSMapping/)
ابزار تغییر رکوردهای DNS محلی برای متصل کردن دامنه‌های سفارشی به IP مشخص.

**قابلیت‌ها:**
- تغییر فایل `/etc/hosts`
- اتصال دامنه به IP دلخواه
- راه‌اندازی محیط توسعه محلی

---

### 3. [نصب DVWA](./DVWA/)
اسکریپت نصب خودکار **Damn Vulnerable Web Application** (DVWA).

**قابلیت‌ها:**
- نصب کامل DVWA
- نصب وابستگی‌ها
- پیکربندی دیتابیس

---

## 🚀 شروع سریع
```bash
# کلون کردن ریپازیتوری
git clone https://github.com/Anon-Core/AnonSecuritySetup.git
cd AnonSecuritySetup

# رفتن به پوشه ابزار مورد نظر
cd WebServer  # یا DNSMapping، DVWA

---

## 📋 پیش‌نیازها

![Debian](https://img.shields.io/badge/Debian-A81D33?style=for-the-badge&logo=debian&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)

- **سیستم‌عامل:** دبیان/اوبونتو لینوکس
- **دسترسی:** Root یا sudo
- **شل:** Bash

---

## ⚠️ هشدار

این ابزارها فقط برای **اهداف آموزشی** و **تست مجاز** هستند. فقط روی سیستم‌هایی که مالک آن هستید یا مجوز صریح دارید استفاده کنید.

---

## 📫 تماس

**گیت‌هاب:** [@Anon-Core](https://github.com/Anon-Core)

---

<div align="center">

**⭐ اگر این ریپازیتوری مفید بود، ستاره بدهید!**

</div>


---
