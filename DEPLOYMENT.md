# Deployment Guide

This guide walks you through deploying your Alumni Directory website to production.

## Vercel Deployment (Recommended)

Vercel is the easiest way to deploy Next.js applications and is created by the same team.

### Prerequisites
- GitHub account
- Vercel account (free tier available)
- Your code pushed to a GitHub repository

### Step-by-Step Deployment

1. **Push Your Code to GitHub**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/yourusername/alumni-directory.git
   git push -u origin main
   ```

2. **Connect to Vercel**
   - Go to [vercel.com](https://vercel.com)
   - Click "Add New Project"
   - Import your GitHub repository
   - Vercel will automatically detect it's a Next.js project

3. **Configure Environment Variables**
   
   In the Vercel dashboard, add these environment variables:
   
   ```
   GOOGLE_SHEET_ID=your_sheet_id
   GOOGLE_SERVICE_ACCOUNT_KEY={"type":"service_account",...}
   EMAIL_USER=your_email@gmail.com
   EMAIL_PASSWORD=your_app_password
   NOTIFICATION_EMAIL=notifications@yourdomain.com
   DATABASE_URL=postgresql://...
   ```

   **Important:** For `GOOGLE_SERVICE_ACCOUNT_KEY`, paste the entire JSON object as a single line.

4. **Set Up Vercel Postgres**
   - In your project dashboard, go to "Storage"
   - Click "Create Database"
   - Select "Postgres"
   - Click "Create"
   - The `DATABASE_URL` will be automatically added to your environment variables

5. **Deploy**
   - Click "Deploy"
   - Wait for the build to complete (usually 2-3 minutes)
   - Your site will be live at `your-project.vercel.app`

6. **Set Up Custom Domain (Optional)**
   - Go to "Settings" > "Domains"
   - Add your custom domain
   - Follow Vercel's instructions to update your DNS settings

### Automatic Deployments

Every push to your `main` branch will automatically deploy to production. For other branches:
- Create a pull request to see preview deployments
- Merge to `main` to deploy to production

## Alternative Deployment Options

### Netlify

1. **Build Command:** `npm run build`
2. **Publish Directory:** `.next`
3. **Environment Variables:** Same as Vercel
4. **Note:** You'll need to set up your own PostgreSQL database

### AWS Amplify

1. Connect your GitHub repository
2. Set build settings:
   ```yaml
   version: 1
   frontend:
     phases:
       preBuild:
         commands:
           - npm ci
       build:
         commands:
           - npm run build
     artifacts:
       baseDirectory: .next
       files:
         - '**/*'
     cache:
       paths:
         - node_modules/**/*
   ```
3. Add environment variables in the Amplify console

### Self-Hosted (VPS/Server)

1. **Requirements:**
   - Node.js 16+ installed
   - PostgreSQL database
   - Process manager (PM2 recommended)
   - Nginx (for reverse proxy)

2. **Build the Application:**
   ```bash
   npm install
   npm run build
   ```

3. **Start with PM2:**
   ```bash
   npm install -g pm2
   pm2 start npm --name "alumni-directory" -- start
   pm2 save
   pm2 startup
   ```

4. **Configure Nginx:**
   ```nginx
   server {
       listen 80;
       server_name yourdomain.com;

       location / {
           proxy_pass http://localhost:3000;
           proxy_http_version 1.1;
           proxy_set_header Upgrade $http_upgrade;
           proxy_set_header Connection 'upgrade';
           proxy_set_header Host $host;
           proxy_cache_bypass $http_upgrade;
       }
   }
   ```

5. **Set Up SSL:**
   ```bash
   sudo certbot --nginx -d yourdomain.com
   ```

## Post-Deployment Checklist

- [ ] Verify all environment variables are set correctly
- [ ] Test the search functionality
- [ ] Submit a test alumni entry
- [ ] Check email notifications are working
- [ ] Test on mobile devices
- [ ] Set up monitoring (Vercel Analytics, Google Analytics, etc.)
- [ ] Configure custom domain (if applicable)
- [ ] Set up backup strategy for your database
- [ ] Add your institution's logo and branding
- [ ] Update metadata and SEO information

## Monitoring and Maintenance

### Vercel Analytics
Enable Vercel Analytics in your project dashboard for:
- Page views
- User interactions
- Performance metrics

### Database Backups
For Vercel Postgres:
- Automatic backups are included
- Access via the Storage tab

For self-hosted:
```bash
# Daily backup script
pg_dump $DATABASE_URL > backup_$(date +%Y%m%d).sql
```

### Logs
View application logs:
- **Vercel:** Project dashboard > Logs
- **Self-hosted:** `pm2 logs alumni-directory`

## Troubleshooting Deployment Issues

### Build Fails
- Check Node.js version matches requirements (16+)
- Verify all dependencies are in `package.json`
- Check for TypeScript errors: `npm run build` locally

### Environment Variables Not Working
- Ensure no extra spaces in variable values
- For JSON values, ensure proper escaping
- Redeploy after adding new variables

### Database Connection Issues
- Verify `DATABASE_URL` format
- Check database is accessible from deployment environment
- Ensure SSL is configured if required

### Email Not Sending
- Verify Gmail App Password (not regular password)
- Check that 2-Step Verification is enabled
- Ensure `EMAIL_USER` and App Password account match

## Scaling Considerations

### Performance Optimization
- Enable Next.js Image Optimization
- Use CDN for static assets
- Implement caching strategies
- Consider edge functions for API routes

### Database Scaling
- Add database indexes for large datasets
- Consider read replicas for high traffic
- Implement connection pooling

### Rate Limiting
Add rate limiting to API routes in production:
```typescript
// Example using Vercel Edge Config
import { ratelimit } from '@/lib/ratelimit';

export async function GET(request: Request) {
  const ip = request.headers.get('x-forwarded-for');
  const { success } = await ratelimit.limit(ip);
  
  if (!success) {
    return new Response('Rate limit exceeded', { status: 429 });
  }
  
  // ... rest of your code
}
```

## Support

For deployment issues:
1. Check Vercel documentation: [vercel.com/docs](https://vercel.com/docs)
2. Review Next.js deployment guide: [nextjs.org/docs/deployment](https://nextjs.org/docs/deployment)
3. Open an issue on GitHub

---

**Happy Deploying! 🚀**
