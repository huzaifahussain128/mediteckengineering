# 🎉 Medi Teck Engineering - Static Website & Deployment Guide

Welcome to the pure static version of the **Medi Teck Engineering** website. This project has been converted into a 100% client-side, high-performance static frontend site. All database integrations, administration dashboards, server-side APIs, and tracking analytics have been completely removed. The site now loads and runs purely on HTML, CSS, JavaScript, and static local data.

The design, spacing, typography, colors, animations, and layouts are **100% identical** to the previous version, preserving the premium visual aesthetic while eliminating backend hosting costs and security overhead.

---

## 📁 Cleaned Folder Structure

Below is the simplified folder structure of the static website:

```
mediteckengineering-main/
├── .cpanel.yml                   # cPanel automatic deployment configuration
├── .gitignore                    # Git ignore settings
├── .htaccess                     # Apache static server redirect/caching rules
├── about.html                    # Public "About Us" page
├── contact.html                  # Public "Contact Us" page (inert visual form)
├── generate-details.ps1          # Automated PowerShell physical details generator
├── IMAGE_REPLACEMENT_GUIDE.md     # Guide for updating images locally
├── index.html                    # Homepage
├── meditec_logo.png              # Site branding logo
├── package.json                  # Lightweight npm settings for local dev
├── products-data.js              # Local static product database (28 items)
├── products.html                 # Public "Products" page
├── products.js                   # Static filtering and rendering logic
├── products/                     # Directory with 28 generated HTML detail pages
│   ├── agss-system.html
│   ├── air-compressor-plant.html
│   ├── bed-head-units.html
│   ├── central-copper-pipeline-system.html
│   ├── double-arm-pendant.html
│   ├── humidifier-bottle.html
│   ├── multi-gas-alarm-digital.html
│   ├── multi-level-area-valve-service-unit.html
│   ├── multi-stage-regulator.html
│   ├── nitrous-manifold-system-automatic.html
│   ├── nitrous-manifold-system-manual.html
│   ├── oxygen-cylinder-regulator.html
│   ├── oxygen-flowmeter.html
│   ├── oxygen-generation-plant.html
│   ├── oxygen-manifold-system-automatic.html
│   ├── oxygen-manifold-system-manual.html
│   ├── rigid-pendant.html
│   ├── silicone-tube.html
│   ├── single-arm-pendant.html
│   ├── single-gas-alarm-digital.html
│   ├── single-gas-alarm-simple.html
│   ├── single-stage-regulator.html
│   ├── suction-injector.html
│   ├── suction-jar.html
│   ├── touch-screen-alarm-premium.html
│   ├── vacuum-controller.html
│   └── vacuum-plant.html
├── README.md                     # This documentation file
├── script.js                     # Core frontend scripting (navigation, animations)
├── services.html                 # Public "Services" page
├── styles.css                    # Shared premium design system stylesheet
└── vercel.json                   # Route rewrites for clean URL static hosting
```

---

## ⚡ Technical Implementations & Refactors

1. **Complete Product Hierarchy Database (`products-data.js`):**
   Stores all **28 distinct medical gas and pipeline accessory products** categorized under:
   - **Medical Gases System** (`medical-gases-system`)
   - **Medical Gases Primary & Secondary Accessories** (`primary-secondary-accessories`)

2. **High-Fidelity Product Filtering (`products.js`):**
   Renders the 28 products dynamically in a grid with category filters, subcategory badges (e.g. *Manifold System*, *Alarm Systems*), and links to dedicated static pages.

3. **Automated Detail Pages (`generate-details.ps1`):**
   A native PowerShell script that compiles `products-data.js` and outputs **28 physical HTML detail pages** in the `/products/` folder with proper layouts, spec sheets, and WhatsApp inquiry buttons.

4. **Inert Contact Form (`contact.html` & `script.js`):**
   Removed all serverless/database API submission handlers. The form remains as a visual UI element, disabled by default, showing a polite informational alert stating that the form is visually disabled.

---

## 🌐 cPanel Git Version Control & Deployment

To link this GitHub repository to your cPanel hosting and deploy it live to **`mtengineering.com.pk`**, follow these simple steps:

### Step 1: Add/Clone Repository in cPanel
1. Log in to your **cPanel** dashboard.
2. Search for **Git** and click on **Git™ Version Control** (under the "Files" section).
3. Click the blue **Create** button on the right.
4. Fill in the repository details:
   - **Clone URL:** `https://github.com/huzaifahussain128/mediteckengineering.git`
   - **Repository Path:** Set this to where cPanel will store the Git files, e.g., `repositories/mediteckengineering` (do not clone directly to `public_html` since Git requires an empty directory).
   - **Repository Name:** `mediteckengineering`
5. Click **Create** to let cPanel clone the repository.

### Step 2: Configure `.cpanel.yml` path (Optional but Recommended)
We have pre-configured a `.cpanel.yml` file in the root of the repository. It instructs cPanel to automatically copy all files to `/home/mtengineering/public_html` (the standard web root directory) using `rsync` while excluding Git logs, `node_modules`, and package scripts.
- **Note:** If your cPanel home folder username is not `mtengineering` (e.g. it is `/home/mtengine/` or similar), simply edit the first line of the `.cpanel.yml` file in your repository:
  ```yaml
  - export DEPLOYPATH=/home/YOUR_CPANEL_USERNAME/public_html
  ```

### Step 3: Trigger Live Deployment
1. In cPanel **Git™ Version Control**, click **Manage** next to the `mediteckengineering` repository.
2. Select the **Pull or Deploy** tab.
3. Click **Update from Remote** to pull any new commits from GitHub.
4. Click **Deploy Head Commit** at the bottom of the page.
5. cPanel will run the `.cpanel.yml` script and copy all static HTML, CSS, JavaScript, and product pages straight to your website's root folder.

Your website will be live on **`mtengineering.com.pk`** instantly!

---

## 💡 Local Testing
To preview your new static site locally:
1. Simply browse to **[http://localhost:3000/](http://localhost:3000/)** (your custom PowerShell server is currently active in the background and serving the entire static catalog).
2. Click on any product's **View Details** button on the Products page or the Home page, and you will see the generated SEO-friendly detail page load instantly!
