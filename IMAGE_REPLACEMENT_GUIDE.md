# Medi Teck Engineering - Image Replacement Guide

## Current Image Setup

The website currently uses high-quality placeholder images from Unsplash. You can easily replace them with your actual product photos.

## How to Replace Images

### Option 1: Direct File Replacement (Recommended)

1. **Create an images folder:**
   ```
   mediteckengineering/
   └── images/
       ├── products/
       │   ├── gas-pipeline.jpg
       │   ├── oxygen-plant.jpg
       │   ├── vacuum-system.jpg
       │   └── ... (other products)
       └── about/
           └── facility.jpg
   ```

2. **Replace images in products.html:**
   Find this pattern:
   ```html
   <img src="https://images.unsplash.com/..." alt="Product Name">
   ```
   
   Replace with:
   ```html
   <img src="images/products/gas-pipeline.jpg" alt="Product Name">
   ```

### Option 2: Update Image URLs

If your images are hosted online, simply replace the Unsplash URLs with your image URLs in:
- `products.html` (12 product images)
- `index.html` (1 about section image)

## Image Specifications

### Recommended Sizes:
- **Product Images:** 600x400 pixels (3:2 ratio)
- **About Section:** 600x600 pixels (1:1 ratio)
- **Format:** JPG or WebP for better performance
- **File Size:** Keep under 200KB each for fast loading

### Image Quality Tips:
1. Use high-resolution photos (minimum 1200px width)
2. Ensure good lighting and clear focus
3. Use consistent background colors
4. Compress images using tools like TinyPNG
5. Consider using WebP format for better compression

## Current Image Locations

### products.html (12 products):
1. Medical Gas Pipeline System - Line ~62
2. PSA Oxygen Generation Plant - Line ~80
3. Medical Vacuum Pump System - Line ~98
4. Medical Air Compressor Plant - Line ~116
5. Modular Operation Theater - Line ~134
6. OT Ceiling Pendant - Line ~152
7. OT LED Surgical Light - Line ~170
8. Stainless Steel Trolley - Line ~188
9. ICU Electric Hospital Bed - Line ~206
10. ICU Medical Pendant - Line ~224
11. Medical Air Handling Unit - Line ~242
12. HEPA Filtration System - Line ~260

### index.html:
1. About Section Image - Line ~104

## Need Help?

If you need professional product photography or image editing services, consider:
- Hiring a professional photographer
- Using AI image enhancement tools
- Consulting with a graphic designer

## Image Optimization Tools

Free online tools to optimize your images:
- **TinyPNG:** https://tinypng.com/
- **Squoosh:** https://squoosh.app/
- **Compressor.io:** https://compressor.io/

## Alternative: Use Local Images

For faster loading and no internet dependency:
1. Save your images in `/images/products/` folder
2. Update all image paths to use relative URLs
3. Test locally before deploying

---

**Last Updated:** 2026
