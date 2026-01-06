#!/bin/bash

# Alumni Directory Setup Script
# This script helps you set up the project quickly

echo "=========================================="
echo "  Alumni Directory Setup"
echo "=========================================="
echo ""

# Check Node.js version
echo "Checking Node.js version..."
NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 16 ]; then
    echo "❌ Error: Node.js 16 or higher is required. Current version: $(node -v)"
    exit 1
fi
echo "✅ Node.js version: $(node -v)"
echo ""

# Install dependencies
echo "Installing dependencies..."
npm install
if [ $? -eq 0 ]; then
    echo "✅ Dependencies installed successfully"
else
    echo "❌ Failed to install dependencies"
    exit 1
fi
echo ""

# Create .env file if it doesn't exist
if [ ! -f .env ]; then
    echo "Creating .env file..."
    cp .env.example .env
    echo "✅ .env file created from template"
    echo ""
    echo "⚠️  IMPORTANT: Please edit .env and add your credentials:"
    echo "   - GOOGLE_SHEET_ID"
    echo "   - GOOGLE_SERVICE_ACCOUNT_KEY"
    echo "   - EMAIL_USER"
    echo "   - EMAIL_PASSWORD"
    echo "   - NOTIFICATION_EMAIL"
    echo "   - DATABASE_URL"
    echo ""
else
    echo "✅ .env file already exists"
    echo ""
fi

# Summary
echo "=========================================="
echo "  Setup Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Edit .env file with your credentials"
echo "2. Set up your Google Sheet (see GOOGLE-SHEETS-GUIDE.md)"
echo "3. Configure PostgreSQL database"
echo "4. Run 'npm run dev' to start development server"
echo ""
echo "For more information, see:"
echo "  - README.md for general setup"
echo "  - GOOGLE-SHEETS-GUIDE.md for Sheet configuration"
echo "  - DEPLOYMENT.md for deployment instructions"
echo ""
echo "Happy coding! 🚀"
