# Alumni Directory Website

A customizable, full-featured alumni directory website built with Next.js 14 that allows educational institutions to showcase their alumni network. Features a searchable directory with Google Sheets integration, email notifications, and responsive design.

![Alumni Directory](https://img.shields.io/badge/Next.js-14-black?style=for-the-badge&logo=next.js)
![TypeScript](https://img.shields.io/badge/TypeScript-5-blue?style=for-the-badge&logo=typescript)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

## ✨ Features

- 🔍 **Advanced Search & Filtering** - Search by name, role, or organization with real-time filtering by batch, country, and organization
- 📱 **Fully Responsive Design** - Beautiful interface that works seamlessly on desktop, tablet, and mobile
- 📊 **Google Sheets Integration** - Use Google Sheets as a simple, collaborative database
- ✉️ **Email Notifications** - Automated notifications for data corrections and new submissions
- 🎨 **Customizable Branding** - Easy to customize colors, fonts, and styling
- 📈 **Search Analytics** - Track usage with PostgreSQL database
- 🚀 **Production Ready** - Built with modern best practices and optimized for performance
- ♿ **Accessible** - Follows web accessibility standards

## 🛠️ Technology Stack

- **Framework:** Next.js 14 (App Router)
- **Language:** TypeScript
- **Database:** PostgreSQL (via Vercel Postgres)
- **Data Source:** Google Sheets API
- **Email:** Nodemailer with Gmail
- **Styling:** Custom CSS with CSS Variables
- **Deployment:** Vercel (recommended)

## 📋 Prerequisites

Before you begin, ensure you have:

- Node.js 16.x or later installed
- A Google Cloud Platform account
- A PostgreSQL database (Vercel Postgres or your own)
- Gmail account with App Password enabled

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/alumni-directory.git
cd alumni-directory
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Set Up Google Sheets API

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select an existing one
3. Enable the Google Sheets API
4. Create a service account:
   - Go to "APIs & Services" > "Credentials"
   - Click "Create Credentials" > "Service Account"
   - Fill in the service account details
   - Click "Create and Continue"
   - Skip optional steps and click "Done"
5. Download the service account JSON key:
   - Click on the created service account
   - Go to "Keys" tab
   - Click "Add Key" > "Create new key"
   - Choose JSON format
   - Save the downloaded file
6. Create a Google Sheet with a tab named 'Summary'
7. Share the sheet with your service account email (found in the JSON file)
8. Copy the Sheet ID from the URL (the long string between `/d/` and `/edit`)

### 4. Set Up Gmail App Password

1. Enable 2-Step Verification in your Google Account:
   - Go to [Google Account Settings](https://myaccount.google.com/)
   - Navigate to Security
   - Enable 2-Step Verification
2. Generate an App Password:
   - Go to Security > 2-Step Verification
   - Scroll to bottom and select "App passwords"
   - Select "Other (Custom name)"
   - Enter "Alumni Website"
   - Click "Generate"
   - Copy the 16-character password

### 5. Set Up PostgreSQL Database

#### Option A: Vercel Postgres (Recommended)

1. Go to your [Vercel Dashboard](https://vercel.com/dashboard)
2. Select your project
3. Go to Storage tab
4. Click "Create Database"
5. Select Postgres
6. Follow the setup wizard
7. Vercel will automatically add `DATABASE_URL` to your environment variables

#### Option B: Your Own PostgreSQL Instance

1. Set up PostgreSQL on your preferred platform
2. Get the connection string: `postgresql://user:password@host:port/database`

### 6. Configure Environment Variables

Create a `.env` file in the root directory:

```bash
cp .env.example .env
```

Edit `.env` with your actual values:

```env
# Google Sheets Configuration
GOOGLE_SHEET_ID=your_sheet_id_from_url
GOOGLE_SERVICE_ACCOUNT_KEY={"type":"service_account","project_id":"..."}

# Email Configuration
EMAIL_USER=your_email@gmail.com
EMAIL_PASSWORD=your_16_character_app_password
NOTIFICATION_EMAIL=notifications@yourdomain.com

# Database Configuration
DATABASE_URL=postgresql://user:password@host:port/database
```

### 7. Set Up Google Sheet Structure

Create a sheet named 'Summary' with these columns (in order):

| Column | Header | Description | Example |
|--------|--------|-------------|---------|
| A | Batch | Graduation year | 2020 |
| B | Student Name | Full name | John Doe |
| C | Country of Residence | Current country | United States |
| D | Current Role | Job title | Software Engineer |
| E | Role Function | Department/Area | Engineering |
| F | Organization | Company name | Google |
| G | LinkedIn URL | Profile link | https://linkedin.com/in/johndoe |

### 8. Initialize the Database

The database will be automatically initialized on first run. You can also manually create the table:

```sql
CREATE TABLE IF NOT EXISTS search_stats (
    id INTEGER PRIMARY KEY,
    total_searches INTEGER DEFAULT 0
);

INSERT INTO search_stats (id, total_searches) VALUES (1, 0);
```

### 9. Run Development Server

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

## 🎨 Customization

### Update Branding

1. **Logo & Favicon:**
   - Replace `public/logo.png` with your institution's logo
   - Replace `public/favicon.ico` with your favicon

2. **Colors:**
   Edit CSS variables in `src/app/globals.css`:
   ```css
   :root {
     --color-primary: #1a365d;        /* Main brand color */
     --color-accent: #d97706;         /* Accent color */
     --color-background: #fafaf9;     /* Background */
     /* ... more variables */
   }
   ```

3. **Fonts:**
   Update the Google Fonts import in `src/app/globals.css`:
   ```css
   @import url('https://fonts.googleapis.com/css2?family=Your+Font&display=swap');
   ```

4. **Institution Name:**
   Edit `src/app/layout.tsx`:
   ```typescript
   export const metadata: Metadata = {
     title: 'Alumni Directory | Your Institution Name',
     description: 'Your custom description',
   };
   ```

### Modify Page Content

- **Header:** Edit `src/components/AlumniDirectory.tsx`
- **Form Fields:** Modify `src/components/SubmissionForm.tsx`
- **Card Layout:** Customize `src/components/AlumniCard.tsx`

## 📦 Building for Production

```bash
npm run build
npm start
```

## 🚀 Deployment

### Deploy to Vercel (Recommended)

1. Push your code to GitHub
2. Go to [Vercel Dashboard](https://vercel.com/dashboard)
3. Click "New Project"
4. Import your GitHub repository
5. Configure environment variables in Vercel dashboard
6. Click "Deploy"

### Deploy to Other Platforms

The application can be deployed to any platform supporting Next.js:
- Netlify
- AWS Amplify
- Digital Ocean App Platform
- Your own server with Node.js

## 📊 Analytics

The system tracks search queries in the PostgreSQL database. Access stats:

```sql
SELECT total_searches FROM search_stats WHERE id = 1;
```

## 🔒 Security Best Practices

1. **Never commit `.env` file** - It's already in `.gitignore`
2. **Use App Passwords** - Never use your actual Gmail password
3. **Restrict Service Account** - Only grant necessary Google Sheets permissions
4. **Use Environment Variables** - Always use env vars for sensitive data in Vercel
5. **Enable Rate Limiting** - Consider adding rate limiting for API routes in production

## 🐛 Troubleshooting

### Google Sheets API Issues

- Verify service account email has access to the sheet
- Check that Sheet ID is correct
- Ensure Google Sheets API is enabled in your project

### Email Issues

- Confirm 2-Step Verification is enabled
- Verify App Password is correct (16 characters, no spaces)
- Check that `EMAIL_USER` matches the account that generated the App Password

### Database Issues

- Verify `DATABASE_URL` format is correct
- Ensure database is accessible from your deployment environment
- Check that the `search_stats` table exists

### Build Issues

```bash
# Clear cache and rebuild
rm -rf .next node_modules
npm install
npm run build
```

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Built with [Next.js](https://nextjs.org/)
- Icons from [Lucide](https://lucide.dev/)
- Fonts from [Google Fonts](https://fonts.google.com/)

## 📧 Support

If you encounter any issues:

1. Check the [Troubleshooting](#-troubleshooting) section
2. Search existing [GitHub Issues](https://github.com/yourusername/alumni-directory/issues)
3. Create a new issue with:
   - Clear description of the problem
   - Steps to reproduce
   - Expected vs actual behavior
   - Screenshots if applicable

## 🗺️ Roadmap

- [ ] Advanced filtering options
- [ ] Export to CSV functionality
- [ ] Admin dashboard
- [ ] Direct Google Sheets write integration
- [ ] Multi-language support
- [ ] Dark mode toggle
- [ ] Alumni profile pages

---

**Made with ❤️ for educational institutions worldwide**
