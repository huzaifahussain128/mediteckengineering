// Mobile Menu Toggle
const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
const navLinks = document.querySelector('.nav-links');

mobileMenuBtn.addEventListener('click', () => {
    navLinks.classList.toggle('active');
    
    // Toggle icon
    const icon = mobileMenuBtn.querySelector('i');
    if (navLinks.classList.contains('active')) {
        icon.classList.remove('fa-bars');
        icon.classList.add('fa-times');
    } else {
        icon.classList.remove('fa-times');
        icon.classList.add('fa-bars');
    }
});

// Close mobile menu when clicking on a link
document.querySelectorAll('.nav-link').forEach(link => {
    link.addEventListener('click', () => {
        navLinks.classList.remove('active');
        const icon = mobileMenuBtn.querySelector('i');
        icon.classList.remove('fa-times');
        icon.classList.add('fa-bars');
    });
});

// Smooth scrolling for anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const targetId = this.getAttribute('href');
        const targetElement = document.querySelector(targetId);
        
        if (targetElement) {
            const offsetTop = targetElement.offsetTop - 80; // Account for fixed navbar
            window.scrollTo({
                top: offsetTop,
                behavior: 'smooth'
            });
        }
    });
});

// Active navigation link highlighting
const sections = document.querySelectorAll('section[id]');
const navLinksItems = document.querySelectorAll('.nav-link');

function highlightNavLink() {
    const scrollY = window.pageYOffset;
    
    sections.forEach(section => {
        const sectionHeight = section.offsetHeight;
        const sectionTop = section.offsetTop - 100;
        const sectionId = section.getAttribute('id');
        
        if (scrollY > sectionTop && scrollY <= sectionTop + sectionHeight) {
            navLinksItems.forEach(link => {
                link.classList.remove('active');
                if (link.getAttribute('href') === `#${sectionId}`) {
                    link.classList.add('active');
                }
            });
        }
    });
}

window.addEventListener('scroll', highlightNavLink);

// Navbar background on scroll
const navbar = document.querySelector('.navbar');

window.addEventListener('scroll', () => {
    if (window.scrollY > 50) {
        navbar.classList.add('scrolled');
    } else {
        navbar.classList.remove('scrolled');
    }
});

// Contact Form Setup (Inert Visual UI Only)
// Contact Form Setup (Active)
if (document.getElementById('contactForm')) {
    // Ensure all inputs are enabled
    const inputs = document.querySelectorAll('#contactForm input, #contactForm textarea, #contactForm select, #contactForm button');
    inputs.forEach(input => {
        input.disabled = false;
    });
    // Initialize contact form handling (same as on contact page)
    function initContactForm() {
        const contactForm = document.getElementById('contactForm');
        const submitBtn = document.getElementById('submitBtn');
        const formMessage = document.getElementById('formMessage');
        if (contactForm) {
            const controls = contactForm.querySelectorAll('input, textarea, select, button');
            controls.forEach(control => { control.disabled = false; });
            if (submitBtn) { submitBtn.disabled = false; submitBtn.style.background = ''; submitBtn.style.cursor = 'pointer'; }
            if (formMessage) { formMessage.style.display = 'none'; }
            contactForm.addEventListener('submit', function (e) {
                e.preventDefault();
                submitBtn.disabled = true;
                const originalBtnHtml = submitBtn.innerHTML;
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Sending...';
                const formData = new FormData(contactForm);
                const submitData = new FormData();
                submitData.append('name', formData.get('fullName'));
                submitData.append('email', formData.get('email'));
                submitData.append('phone', formData.get('phone'));
                submitData.append('subject', formData.get('subject'));
                submitData.append('message', formData.get('message'));
                fetch('submit-contact.php', { method: 'POST', body: submitData })
                    .then(response => response.json())
                    .then(data => {
                        submitBtn.disabled = false;
                        submitBtn.innerHTML = originalBtnHtml;
                        if (formMessage) {
                            formMessage.style.display = 'block';
                            formMessage.className = 'form-message';
                            if (data.success) {
                                formMessage.style.background = 'rgba(16, 185, 129, 0.1)';
                                formMessage.style.color = '#10b981';
                                formMessage.style.borderLeft = '4px solid #10b981';
                                formMessage.innerHTML = `<i class="fas fa-check-circle"></i> ${data.message}`;
                                contactForm.reset();
                            } else {
                                formMessage.style.background = 'rgba(239, 68, 68, 0.1)';
                                formMessage.style.color = '#ef4444';
                                formMessage.style.borderLeft = '4px solid #ef4444';
                                formMessage.innerHTML = `<i class="fas fa-exclamation-circle"></i> ${data.message}`;
                            }
                        }
                    })
                    .catch(err => {
                        submitBtn.disabled = false;
                        submitBtn.innerHTML = originalBtnHtml;
                        if (formMessage) {
                            formMessage.style.display = 'block';
                            formMessage.style.background = 'rgba(239, 68, 68, 0.1)';
                            formMessage.style.color = '#ef4444';
                            formMessage.style.borderLeft = '4px solid #ef4444';
                            formMessage.innerHTML = `<i class="fas fa-exclamation-circle"></i> An error occurred. Please try again later.`;
                        }
                    });
            });
        }
    }
    initContactForm();
}

// Helper function to show form status
function showFormStatus(message, type) {
    if (!formStatus) return;
    formStatus.textContent = message;
    formStatus.className = 'form-status ' + type;
    formStatus.style.display = 'block';
    
    // Style for info message
    if (type === 'info') {
        formStatus.style.background = 'rgba(100, 116, 139, 0.1)';
        formStatus.style.color = '#64748b';
        formStatus.style.borderLeft = '4px solid #64748b';
        formStatus.style.padding = '1rem';
        formStatus.style.borderRadius = '8px';
    }
}

// Add animation on scroll
const observerOptions = {
    threshold: 0.15,
    rootMargin: '0px 0px -80px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, observerOptions);

// Observe service cards
document.querySelectorAll('.service-card').forEach((card, index) => {
    card.style.opacity = '0';
    card.style.transform = 'translateY(40px)';
    card.style.transition = `opacity 0.7s ease ${index * 0.1}s, transform 0.7s ease ${index * 0.1}s`;
    observer.observe(card);
});

// Observe contact items
document.querySelectorAll('.contact-item').forEach((item, index) => {
    item.style.opacity = '0';
    item.style.transform = 'translateY(30px)';
    item.style.transition = `opacity 0.6s ease ${index * 0.15}s, transform 0.6s ease ${index * 0.15}s`;
    observer.observe(item);
});

// Parallax effect for hero section
window.addEventListener('scroll', () => {
    const hero = document.querySelector('.hero');
    if (hero) {
        const scrolled = window.pageYOffset;
        hero.style.backgroundPositionY = scrolled * 0.5 + 'px';
    }
});

// Add loading animation
window.addEventListener('load', () => {
    document.body.style.opacity = '0';
    document.body.style.transition = 'opacity 0.5s ease';
    setTimeout(() => {
        document.body.style.opacity = '1';
    }, 100);
});

// Scroll to Top Button
const scrollTopBtn = document.getElementById('scrollTop');

if (scrollTopBtn) {
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

// Load featured products on home page from static database
function loadFeaturedProducts() {
    const productsGrid = document.getElementById('productsGrid');
    
    if (!productsGrid) return; // Not on home page
    
    try {
        const products = window.PRODUCTS_DATA || [];
        
        // Filter only active products
        const activeProducts = products.filter(p => p.status === 'active' || !p.status);
        
        // Show only first 6 products on home page
        const featuredProducts = activeProducts.slice(0, 6);
        
        if (featuredProducts.length === 0) {
            productsGrid.innerHTML = '<p style="text-align: center; color: var(--text-grey); padding: 3rem; font-size: 1.1rem;"><i class="fas fa-box-open" style="font-size: 3rem; display: block; margin-bottom: 1rem; opacity: 0.5;"></i>No products available yet.</p>';
            return;
        }
        
        // Render products
        productsGrid.innerHTML = featuredProducts.map(product => {
            const description = product.description || 'No description available';
            const imageUrl = product.image_url || 'https://via.placeholder.com/400x300?text=No+Image';
            
            return `
            <div class="featured-product-card">
                <div class="featured-product-image">
                    <img src="${imageUrl}" alt="${product.name}" onerror="this.src='https://via.placeholder.com/400x300?text=No+Image'">
                </div>
                <div class="featured-product-info">
                    <h3>${product.name}</h3>
                    <p>${description.substring(0, 120)}${description.length > 120 ? '...' : ''}</p>
                    <a href="products/${product.slug}.html" class="featured-product-btn">View Details</a>
                </div>
            </div>
        `;
        }).join('');
        
        console.log('Loaded', featuredProducts.length, 'featured static products');
        
    } catch (error) {
        console.error('Error loading featured products:', error);
        productsGrid.innerHTML = '<p style="text-align: center; color: #dc3545;"><i class="fas fa-exclamation-triangle"></i> Error loading products. Please try again later.</p>';
    }
}

// Load featured products when page loads
if (window.location.pathname.endsWith('index.html') || window.location.pathname === '/' || window.location.pathname === '') {
    window.addEventListener('load', loadFeaturedProducts);
}
