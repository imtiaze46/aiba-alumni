# Contributing to Alumni Directory

First off, thank you for considering contributing to Alumni Directory! It's people like you that make this project better for educational institutions worldwide.

## Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code. Please report unacceptable behavior to the project maintainers.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the existing issues to avoid duplicates. When you create a bug report, include as many details as possible:

- **Use a clear and descriptive title**
- **Describe the exact steps to reproduce the problem**
- **Provide specific examples** to demonstrate the steps
- **Describe the behavior you observed and what you expected**
- **Include screenshots** if applicable
- **Describe your environment** (browser, OS, Node version)

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, include:

- **Use a clear and descriptive title**
- **Provide a detailed description** of the suggested enhancement
- **Explain why this enhancement would be useful**
- **List any alternative solutions** you've considered

### Pull Requests

1. **Fork the repository** and create your branch from `main`:
   ```bash
   git checkout -b feature/amazing-feature
   ```

2. **Make your changes**:
   - Follow the existing code style
   - Add tests if applicable
   - Update documentation as needed

3. **Test your changes**:
   ```bash
   npm run dev
   npm run build
   npm run lint
   ```

4. **Commit your changes**:
   ```bash
   git commit -m 'Add some amazing feature'
   ```
   
   Follow conventional commit format:
   - `feat:` for new features
   - `fix:` for bug fixes
   - `docs:` for documentation
   - `style:` for formatting
   - `refactor:` for refactoring
   - `test:` for tests
   - `chore:` for maintenance

5. **Push to your fork**:
   ```bash
   git push origin feature/amazing-feature
   ```

6. **Open a Pull Request** with:
   - Clear title and description
   - Link to any related issues
   - Screenshots for UI changes
   - List of changes made

## Development Setup

1. **Prerequisites**:
   - Node.js 16.x or later
   - npm or yarn
   - Git

2. **Clone and install**:
   ```bash
   git clone https://github.com/yourusername/alumni-directory.git
   cd alumni-directory
   npm install
   ```

3. **Set up environment**:
   ```bash
   cp .env.example .env
   # Add your credentials to .env
   ```

4. **Run development server**:
   ```bash
   npm run dev
   ```

## Style Guidelines

### TypeScript/JavaScript
- Use TypeScript for all new files
- Follow existing code patterns
- Use meaningful variable names
- Add JSDoc comments for complex functions
- Avoid `any` type when possible

### CSS
- Use CSS variables for colors and spacing
- Follow BEM naming convention where applicable
- Keep selectors specific but not overly nested
- Mobile-first responsive design

### React Components
- Use functional components with hooks
- Keep components focused and single-purpose
- Use TypeScript interfaces for props
- Handle loading and error states

### Git Commits
- Write clear, concise commit messages
- Use conventional commit format
- Reference issue numbers when applicable
- Keep commits focused on single changes

## Testing

Currently, the project uses manual testing. We welcome contributions to add:
- Unit tests (Jest)
- Integration tests
- E2E tests (Playwright/Cypress)

## Documentation

- Update README.md for significant changes
- Add JSDoc comments to complex functions
- Update guides (DEPLOYMENT.md, GOOGLE-SHEETS-GUIDE.md) as needed
- Include inline comments for complex logic

## Project Structure

```
alumni-website/
├── src/
│   ├── app/              # Next.js app directory
│   │   ├── api/          # API routes
│   │   ├── globals.css   # Global styles
│   │   ├── layout.tsx    # Root layout
│   │   └── page.tsx      # Home page
│   ├── components/       # React components
│   ├── lib/             # Utility functions
│   └── types/           # TypeScript types
├── public/              # Static assets
├── .github/             # GitHub configs
└── [config files]       # Various config files
```

## Feature Requests

We track feature requests as GitHub issues. Before creating one:
1. Check if it already exists
2. Clearly describe the feature
3. Explain the use case
4. Discuss potential implementation

## Questions?

Feel free to:
- Open an issue for questions
- Start a discussion on GitHub
- Reach out to maintainers

## Recognition

Contributors will be recognized in:
- GitHub contributors page
- Release notes for significant contributions
- Project README (optional)

Thank you for contributing! 🎉
