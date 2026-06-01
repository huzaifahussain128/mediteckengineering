// Load Products - Fully Static Version
let allProducts = window.PRODUCTS_DATA || [];
let useDatabase = false;

// Load products when page loads
window.addEventListener('load', () => {
    loadStaticProducts();
    setupFilters();
    setupScrollTop();
});

// Load products from static data
function loadStaticProducts() {
    const productsGrid = document.querySelector('.products-section .products-grid');
    
    if (!productsGrid) return;
    
    // Filter only active products
    const activeProducts = allProducts.filter(p => p.status === 'active' || !p.status);
    
    if (activeProducts.length === 0) {
        productsGrid.innerHTML = `
            <div style="grid-column: 1/-1; text-align: center; padding: 4rem;">
                <i class="fas fa-box-open" style="font-size: 4rem; color: var(--text-grey); opacity: 0.5; display: block; margin-bottom: 1rem;"></i>
                <p style="color: var(--text-grey); font-size: 1.1rem;">No products available yet. Check back soon!</p>
            </div>
        `;
        return;
    }
    
    // Load dynamic categories
    loadDynamicCategories(activeProducts);
    
    // Render products
    renderProducts(activeProducts);
    
    console.log('Loaded', activeProducts.length, 'static products');
}

// Render products to grid
function renderProducts(products) {
    const productsGrid = document.querySelector('.products-grid');
    
    if (!productsGrid) return;
    
    productsGrid.innerHTML = products.map((product, index) => {
        const description = product.description || 'No description available';
        const imageUrl = product.image_url || 'https://via.placeholder.com/600x400?text=No+Image';
        const features = Array.isArray(product.features) ? product.features : [];
        
        return `
            <div class="product-card" data-category="${product.category}" style="background: white; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 6px rgba(0,0,0,0.1); transition: all 0.3s; animation: fadeInUp 0.6s ease ${index * 0.05}s both;">
                <div class="product-image" style="height: 250px; overflow: hidden; position: relative;">
                    <img src="${imageUrl}" alt="${product.name}" style="width: 100%; height: 100%; object-fit: cover; transition: transform 0.3s;" onerror="this.src='https://via.placeholder.com/600x400?text=No+Image'">
                    <div class="product-image-overlay" style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: linear-gradient(135deg, rgba(45, 137, 199, 0.9), rgba(26, 107, 163, 0.9)), url('${imageUrl}') center/cover; display: flex; align-items: center; justify-content: center; opacity: 0; transition: opacity 0.3s;">
                        <i class="fas fa-${getCategoryIcon(product.category)}" style="font-size: 3rem; color: white;"></i>
                    </div>
                </div>
                <div class="product-info" style="padding: 1.5rem; display: flex; flex-direction: column; height: calc(100% - 250px);">
                    <span class="product-category-badge" style="align-self: flex-start; display: inline-block; padding: 0.4rem 0.8rem; background: rgba(45, 137, 199, 0.1); color: #2D89C7; border-radius: 50px; font-size: 0.75rem; font-weight: 600; margin-bottom: 0.75rem;">${product.subcategory}</span>
                    <h3 style="font-size: 1.25rem; font-weight: 700; margin-bottom: 0.75rem; color: #1e293b;">${product.name}</h3>
                    <p style="color: #64748b; font-size: 0.95rem; line-height: 1.6; margin-bottom: 1.25rem; flex-grow: 1;">${description.substring(0, 140)}${description.length > 140 ? '...' : ''}</p>
                    <a href="products/${product.slug}.html" class="product-btn" style="display: inline-block; width: 100%; text-align: center; padding: 0.75rem 1.5rem; background: linear-gradient(135deg, #2D89C7 0%, #1a6ba3 100%); color: white; text-decoration: none; border-radius: 8px; font-weight: 600; transition: all 0.3s;">View Details</a>
                </div>
            </div>
        `;
    }).join('');
    
    // Add hover effects
    const productCards = document.querySelectorAll('.product-card');
    productCards.forEach(card => {
        card.addEventListener('mouseenter', () => {
            card.style.transform = 'translateY(-8px)';
            card.style.boxShadow = '0 12px 24px rgba(0,0,0,0.15)';
            const overlay = card.querySelector('.product-image-overlay');
            if (overlay) overlay.style.opacity = '1';
            const img = card.querySelector('img');
            if (img) img.style.transform = 'scale(1.1)';
        });
        
        card.addEventListener('mouseleave', () => {
            card.style.transform = 'translateY(0)';
            card.style.boxShadow = '0 4px 6px rgba(0,0,0,0.1)';
            const overlay = card.querySelector('.product-image-overlay');
            if (overlay) overlay.style.opacity = '0';
            const img = card.querySelector('img');
            if (img) img.style.transform = 'scale(1)';
        });
    });
}

// Get icon for category
function getCategoryIcon(category) {
    const icons = {
        'medical-gases-system': 'gas-pump',
        'primary-secondary-accessories': 'flask'
    };
    return icons[category] || 'medical-kit';
}

// Load dynamic categories from products
function loadDynamicCategories(products) {
    const filterButtons = document.getElementById('filterButtons');
    if (!filterButtons) return;
    
    // Get unique categories
    const categories = [...new Set(products.map(p => p.category).filter(c => c))];
    
    // Clear existing buttons (keep "All Products")
    filterButtons.innerHTML = '<button class="filter-btn active" data-filter="all" style="padding: 0.75rem 1.5rem; border: 2px solid #2D89C7; background: #2D89C7; color: white; border-radius: 50px; font-weight: 600; cursor: pointer; transition: all 0.3s;">All Products</button>';
    
    // Add category buttons
    categories.forEach(category => {
        const button = document.createElement('button');
        button.className = 'filter-btn';
        button.setAttribute('data-filter', category);
        button.textContent = formatCategory(category);
        button.style.cssText = 'padding: 0.75rem 1.5rem; border: 2px solid #2D89C7; background: white; color: #2D89C7; border-radius: 50px; font-weight: 600; cursor: pointer; transition: all 0.3s;';
        
        // Add hover effect
        button.addEventListener('mouseenter', () => {
            if (!button.classList.contains('active')) {
                button.style.background = 'rgba(45, 137, 199, 0.1)';
            }
        });
        
        button.addEventListener('mouseleave', () => {
            if (!button.classList.contains('active')) {
                button.style.background = 'white';
            }
        });
        
        filterButtons.appendChild(button);
    });
}

// Format category name
function formatCategory(category) {
    if (category === 'medical-gases-system') {
        return 'Medical Gases System';
    }
    if (category === 'primary-secondary-accessories') {
        return 'Primary & Secondary Accessories';
    }
    return category;
}

// Setup filter buttons
function setupFilters() {
    const filterButtons = document.querySelectorAll('.filter-btn');
    
    filterButtons.forEach(button => {
        button.addEventListener('click', () => {
            // Remove active class from all buttons in the filter bar
            const allFilterBtns = document.querySelectorAll('.filter-btn');
            allFilterBtns.forEach(btn => {
                btn.classList.remove('active');
                btn.style.background = 'white';
                btn.style.color = '#2D89C7';
            });
            
            // Add active class to clicked button
            button.classList.add('active');
            button.style.background = '#2D89C7';
            button.style.color = 'white';
            
            // Get filter value
            const filterValue = button.getAttribute('data-filter');
            
            // Filter static products
            const filteredProducts = filterValue === 'all' 
                ? allProducts.filter(p => p.status === 'active' || !p.status)
                : allProducts.filter(p => p.category === filterValue && (p.status === 'active' || !p.status));
            
            renderProducts(filteredProducts);
        });
    });
}

// Setup scroll to top button
function setupScrollTop() {
    const scrollTopBtn = document.getElementById('scrollTop');
    
    if (!scrollTopBtn) return;
    
    window.addEventListener('scroll', () => {
        if (window.pageYOffset > 300) {
            scrollTopBtn.classList.add('visible');
        } else {
            scrollTopBtn.classList.remove('visible');
        }
    });
    
    scrollTopBtn.addEventListener('click', () => {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
}

// Add CSS animation
const style = document.createElement('style');
style.textContent = `
    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
`;
document.head.appendChild(style);
