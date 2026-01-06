# Quick Start Guide

Get your Alumni Directory up and running in 10 minutes!

## Prerequisites Checklist
- [ ] Node.js 16+ installed
- [ ] Gmail account with 2FA enabled
- [ ] Google Cloud project created
- [ ] PostgreSQL database ready (or use Vercel Postgres)

## 5-Minute Setup

### 1. Install Dependencies (1 minute)
```bash
cd alumni-website
npm install
```

### 2. Google Sheets Setup (2 minutes)
1. Create a Google Sheet
2. Add tab named "Summary"
3. Add these columns: Batch, Student Name, Country of Residence, Current Role, Role Function, Organization, LinkedIn URL
4. Share with your service account email
5. Copy Sheet ID from URL

### 3. Environment Setup (2 minutes)
```bash
cp .env.example .env
```

Edit `.env` with your values:
```env
GOOGLE_SHEET_ID=your_sheet_id
GOOGLE_SERVICE_ACCOUNT_KEY={"type":"service_account",...}
EMAIL_USER=your_email@gmail.com
EMAIL_PASSWORD=16_char_app_password
NOTIFICATION_EMAIL=notifications@yourdomain.com
DATABASE_URL=postgresql://...
```

### 4. Run Development Server
```bash
npm run dev
```

Visit http://localhost:3000 🎉

## What's Next?

### Customize Your Site
1. **Add your logo**: Place `logo.png` in `/public`
2. **Update colors**: Edit CSS variables in `src/app/globals.css`
3. **Change title**: Update `src/app/layout.tsx`

### Add Alumni Data
1. Open your Google Sheet
2. Add alumni information starting from Row 2
3. Refresh your website to see updates

### Deploy to Production
```bash
# Push to GitHub
git init
git add .
git commit -m "Initial commit"
git push

# Deploy to Vercel
1. Go to vercel.com
2. Import your GitHub repo
3. Add environment variables
4. Deploy!
```

## Common Issues

**Build fails?**
- Check Node.js version: `node -v` (need 16+)
- Clear cache: `rm -rf .next node_modules && npm install`

**No data showing?**
- Verify Sheet is named "Summary"
- Check service account has access
- Confirm Sheet ID is correct

**Email not working?**
- Use App Password, not regular password
- Enable 2FA in Google Account first

## Getting Help

- 📖 Full documentation: [README.md](README.md)
- 📊 Sheet setup: [GOOGLE-SHEETS-GUIDE.md](GOOGLE-SHEETS-GUIDE.md)
- 🚀 Deployment: [DEPLOYMENT.md](DEPLOYMENT.md)
- 🤝 Contributing: [CONTRIBUTING.md](CONTRIBUTING.md)

## Project Structure

```
alumni-website/
├── src/
│   ├── app/              # Pages and API routes
│   ├── components/       # React components
│   ├── lib/             # Utilities (sheets, email, db)
│   └── types/           # TypeScript definitions
├── public/              # Static assets (logo, favicon)
├── .env                 # Your secrets (gitignored)
└── package.json         # Dependencies
```

## Key Features

✅ Search and filter alumni  
✅ Responsive design  
✅ Google Sheets database  
✅ Email notifications  
✅ Usage analytics  
✅ Easy customization  

---

**Ready to launch? Let's go! 🚀**
