# PowerShell script to generate 28 HTML product detail pages inside the products/ subfolder
$productsDir = Join-Path (Get-Location) "products"
if (!(Test-Path $productsDir)) {
    New-Item -ItemType Directory -Path $productsDir | Out-Null
}

$products = @(
    # === CATEGORY A: MEDICAL GASES SYSTEM ===
    @{
        slug = "central-copper-pipeline-system"
        name = "Central Copper Pipeline System"
        category = "medical-gases-system"
        subcategory = "Central Copper Pipeline System"
        description = "Medical grade degreased copper pipes and fittings manufactured under strict quality standards. Essential for reliable medical gas distribution."
        image_url = "https://images.unsplash.com/photo-1581092160607-ee22621dd758?w=800&h=600&fit=crop"
        features = @("High purity degreased copper", "BS EN 13348 compliant", "Leak-proof brazed joints", "Corrosion resistant surfaces")
    },
    @{
        slug = "oxygen-manifold-system-automatic"
        name = "Oxygen Manifold System (Automatic)"
        category = "medical-gases-system"
        subcategory = "Manifold System"
        description = "High-pressure automatic oxygen manifold system with smart electronic changeover to ensure 100% uninterrupted oxygen supply."
        image_url = "https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=800&h=600&fit=crop"
        features = @("Smart electronic changeover", "Dual stage pressure regulator", "High pressure flexible copper tails", "Audio-visual status indicators")
    },
    @{
        slug = "oxygen-manifold-system-manual"
        name = "Oxygen Manifold System (Manual)"
        category = "medical-gases-system"
        subcategory = "Manifold System"
        description = "Reliable manual oxygen manifold system featuring robust valves and heavy-duty regulators for safe cylinder bank switching."
        image_url = "https://images.unsplash.com/photo-1581092918056-0c4c3acd3789?w=800&h=600&fit=crop"
        features = @("Heavy-duty brass construction", "Manual isolation valves", "Clear pressure indicators", "Cost-effective safety design")
    },
    @{
        slug = "nitrous-manifold-system-automatic"
        name = "Nitrous Manifold System (Automatic)"
        category = "medical-gases-system"
        subcategory = "Manifold System"
        description = "Automatic changeover Nitrous Oxide manifold system, designed to handle nitrous cylinder pressure changes with micro-second accuracy."
        image_url = "https://images.unsplash.com/photo-1603126857599-f6e157fa2fe6?w=800&h=600&fit=crop"
        features = @("Smart digital controller", "Integrated pressure relief valves", "Auto-switchover cylinder banks", "Wall-mounted space saving cabinet")
    },
    @{
        slug = "nitrous-manifold-system-manual"
        name = "Nitrous Manifold System (Manual)"
        category = "medical-gases-system"
        subcategory = "Manifold System"
        description = "Manually operated Nitrous Oxide manifold system with durable brass headers, built for long-term clinical safety."
        image_url = "https://images.unsplash.com/photo-1584017911766-d451b3d0e843?w=800&h=600&fit=crop"
        features = @("Durable copper/brass headers", "Manual lever switch control", "High-accuracy dual gauges", "Pre-tested safety valves")
    },
    @{
        slug = "oxygen-generation-plant"
        name = "Oxygen Generation Plant"
        category = "medical-gases-system"
        subcategory = "Central Medical Gas Plants"
        description = "On-site Pressure Swing Adsorption (PSA) oxygen generation plant. Produces high-purity medical oxygen from compressed ambient air."
        image_url = "https://images.unsplash.com/photo-1616391182219-e080b4d1043a?w=800&h=600&fit=crop"
        features = @("93% &plusmn; 3% purity output", "Energy efficient operation", "PLC automated controls", "Integrated purity analyzer")
    },
    @{
        slug = "air-compressor-plant"
        name = "Air Compressor Plant"
        category = "medical-gases-system"
        subcategory = "Central Medical Gas Plants"
        description = "Multi-stage oil-free medical air compressor plant with desiccant dryers and high-efficiency filtration to provide pure breathing air."
        image_url = "https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=800&h=600&fit=crop"
        features = @("100% oil-free compression", "Desiccant air dryers", "Multi-stage bacterial filtration", "PLC auto-alternation control")
    },
    @{
        slug = "vacuum-plant"
        name = "Vacuum Plant"
        category = "medical-gases-system"
        subcategory = "Central Medical Gas Plants"
        description = "High-efficiency duplex/triplex medical vacuum plant with chemical-resistant pumps, dual bacterial filters, and automatic receivers."
        image_url = "https://images.unsplash.com/photo-1516549655169-df83a0774514?w=800&h=600&fit=crop"
        features = @("High efficiency vacuum pumps", "Duplex bacterial filters", "ASME receiver tanks", "Touch-screen system monitor")
    },
    @{
        slug = "agss-system"
        name = "AGSS System"
        category = "medical-gases-system"
        subcategory = "Central Medical Gas Plants"
        description = "Anesthetic Gas Scavenging System (AGSS) to safely remove waste anesthetic gas mixtures from operating theaters."
        image_url = "https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?w=800&h=600&fit=crop"
        features = @("High-capacity blower pumps", "Adjustable flow regulator", "Anti-spill theater terminals", "ISO 7396-2 safety compliant")
    },
    @{
        slug = "bed-head-units"
        name = "Bed Head Units"
        category = "medical-gases-system"
        subcategory = "Bed Head Units"
        description = "Modern, ergonomic bed head console panels integrated with gas outlets, electrical sockets, nurse call systems, and direct/indirect lighting."
        image_url = "https://images.unsplash.com/photo-1586773860418-d37222d8fce3?w=800&h=600&fit=crop"
        features = @("Extruded aluminum profiles", "Integrated gas & electric slots", "Sleek, low-profile design", "Direct/indirect LED lights")
    },
    @{
        slug = "single-arm-pendant"
        name = "Single Arm Pendant"
        category = "medical-gases-system"
        subcategory = "Ceiling Pendants"
        description = "Ceiling-mounted single-arm surgical pendant providing flexible mounting for equipment, medical gas outlets, and power supply in OTs and ICUs."
        image_url = "https://images.unsplash.com/photo-1551076805-e1869033e561?w=800&h=600&fit=crop"
        features = @("330-degree arm rotation", "Pneumatic or mechanical brakes", "High load capacity shelves", "Modular gas/electric console")
    },
    @{
        slug = "double-arm-pendant"
        name = "Double Arm Pendant"
        category = "medical-gases-system"
        subcategory = "Ceiling Pendants"
        description = "Heavy-duty dual-arm ceiling pendant offering maximum reach, flexibility, and equipment support for complex surgical and intensive care environments."
        image_url = "https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?w=800&h=600&fit=crop"
        features = @("Dual articulating arms", "Modular console interface", "Pre-piped and pre-wired internally", "Precision gas bearings")
    },
    @{
        slug = "rigid-pendant"
        name = "Rigid Pendant"
        category = "medical-gases-system"
        subcategory = "Ceiling Pendants"
        description = "Robust fixed-height ceiling pendant, providing space-saving access to essential medical gases and power in emergency bays."
        image_url = "https://images.unsplash.com/photo-1516549655169-df83a0774514?w=800&h=600&fit=crop"
        features = @("Fixed heavy-duty steel shaft", "Compact vertical console", "High-capacity gas outlets", "Low maintenance design")
    },

    # === CATEGORY B: PRIMARY & SECONDARY ACCESSORIES ===
    @{
        slug = "single-gas-zone-service-unit"
        name = "Single Gas Zone Service Unit"
        category = "primary-secondary-accessories"
        subcategory = "Area Valve Service Unit"
        description = "Visual and physical zone isolation valve box for single medical gas pipeline, featuring emergency pull-to-shut handle."
        image_url = "https://images.unsplash.com/photo-1581092918056-0c4c3acd3789?w=800&h=600&fit=crop"
        features = @("Lockable emergency window", "Integrated physical gauge", "Leak-proof valve design", "Clear color-coded label")
    },
    @{
        slug = "multi-level-area-valve-service-unit"
        name = "Multi Level Area Valve Service Unit"
        category = "primary-secondary-accessories"
        subcategory = "Area Valve Service Unit"
        description = "Multi-tier area valve service unit containing isolation valves and monitoring gauges for 2 to 6 medical gas pipelines in a single console."
        image_url = "https://images.unsplash.com/photo-1581092160607-ee22621dd758?w=800&h=600&fit=crop"
        features = @("Multi-tier compact cabinet", "Individual zone isolation", "Dual physical pressure sensors", "Physical override layout")
    },
    @{
        slug = "multi-gas-alarm-digital"
        name = "Multi Gas Alarm (Digital Display)"
        category = "primary-secondary-accessories"
        subcategory = "Alarm Systems"
        description = "Real-time digital gas alarm panel designed to monitor line pressure for up to 6 medical gases with clear alphanumeric readings."
        image_url = "https://images.unsplash.com/photo-1603126857599-f6e157fa2fe6?w=800&h=600&fit=crop"
        features = @("High brightness LED readouts", "Adjustable pressure thresholds", "Audio-visual alarm mute", "BMS network connectivity")
    },
    @{
        slug = "single-gas-alarm-digital"
        name = "Single Gas Alarm (Digital Display)"
        category = "primary-secondary-accessories"
        subcategory = "Alarm Systems"
        description = "Dedicated single gas electronic alarm panel with precision pressure transducer input and local numerical display."
        image_url = "https://images.unsplash.com/photo-1584017911766-d451b3d0e843?w=800&h=600&fit=crop"
        features = @("Microprocessor controls", "Digital numerical panel", "High/Low warning trigger", "Sealed membrane keyboard")
    },
    @{
        slug = "single-gas-alarm-simple"
        name = "Single Gas Alarm (Simple)"
        category = "primary-secondary-accessories"
        subcategory = "Alarm Systems"
        description = "Traditional LED indicator medical gas alarm, using high-reliability pressure switches to warn clinicians of pressure drops."
        image_url = "https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=800&h=600&fit=crop"
        features = @("Dual LED indicator lamps", "Audible piezo buzzer", "Simple terminal switch input", "Compact flush-mount build")
    },
    @{
        slug = "touch-screen-alarm-premium"
        name = "Touch Screen Alarm (Premium)"
        category = "primary-secondary-accessories"
        subcategory = "Alarm Systems"
        description = "State-of-the-art interactive touch-screen alarm system. Monitors gas pressure, flow rates, and historical logs with graphical UI."
        image_url = "https://images.unsplash.com/photo-1576091160550-2173dba999ef?w=800&h=600&fit=crop"
        features = @("7-inch capacitive touch LCD", "Live pressure trend graphing", "Automatic email/SMS alerts", "Modbus TCP/IP support")
    },
    @{
        slug = "oxygen-flowmeter"
        name = "Oxygen Flowmeter"
        category = "primary-secondary-accessories"
        subcategory = "Medical Gas Accessories"
        description = "Precision medical oxygen flowmeter with humidifier bottle. Designed for accurate regulation and delivery of oxygen therapy to patients."
        image_url = "https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=800&h=600&fit=crop"
        features = @("High-impact polycarbonate tube", "Calibrated flow regulation", "Autoclavable humidifier bottle", "Double-sealed inlet stem")
    },
    @{
        slug = "humidifier-bottle"
        name = "Humidifier Bottle"
        category = "primary-secondary-accessories"
        subcategory = "Medical Gas Accessories"
        description = "High-capacity autoclavable medical humidifier bottle with bubble diffuser, providing silent humidification for oxygen therapy."
        image_url = "https://images.unsplash.com/photo-1516549655169-df83a0774514?w=800&h=600&fit=crop"
        features = @("Autoclavable polycarbonate body", "Integrated brass fittings", "Silent bubble diffuser", "Over-pressure safety valve")
    },
    @{
        slug = "vacuum-controller"
        name = "Vacuum Controller"
        category = "primary-secondary-accessories"
        subcategory = "Medical Gas Accessories"
        description = "Precision surgical vacuum controller regulator with fine suction gauge control and emergency full-suction override."
        image_url = "https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=800&h=600&fit=crop"
        features = @("REG/OFF/MAX toggle control", "Fine vacuum control gauge", "High accuracy scale (mmHg)", "Internal safety filter")
    },
    @{
        slug = "suction-injector"
        name = "Suction Injector"
        category = "primary-secondary-accessories"
        subcategory = "Medical Gas Accessories"
        description = "Venturi-effect suction injector driven by compressed air or oxygen, providing reliable suction where central vacuum is unavailable."
        image_url = "https://images.unsplash.com/photo-1586773860418-d37222d8fce3?w=800&h=600&fit=crop"
        features = @("Venturi-effect mechanism", "Dual drive compatibility", "Integrated vacuum gauge", "Compact chrome plated body")
    },
    @{
        slug = "suction-jar"
        name = "Suction Jar"
        category = "primary-secondary-accessories"
        subcategory = "Medical Gas Accessories"
        description = "Heavy-duty autoclavable surgical suction collection jar featuring an automatic anti-overflow safety float valve."
        image_url = "https://images.unsplash.com/photo-1551076805-e1869033e561?w=800&h=600&fit=crop"
        features = @("2000ml / 4000ml capacities", "Autoclavable PSU/Polycarbonate", "Anti-overflow safety float", "Flexible wall bracket hanger")
    },
    @{
        slug = "silicone-tube"
        name = "Silicone Tube"
        category = "primary-secondary-accessories"
        subcategory = "Medical Gas Accessories"
        description = "Medical-grade platinum cured translucent silicone tubing, ideal for clinical suction, surgical drains, and fluid transfer."
        image_url = "https://images.unsplash.com/photo-1584017911766-d451b3d0e843?w=800&h=600&fit=crop"
        features = @("Platinum-cured medical grade", "Non-toxic & odor-free", "Autoclavable up to 134°C", "High flexibility & tear strength")
    },
    @{
        slug = "oxygen-cylinder-regulator"
        name = "Oxygen Cylinder Regulator"
        category = "primary-secondary-accessories"
        subcategory = "Medical Gas Accessories"
        description = "Durable two-stage oxygen cylinder pressure regulator. Provides safe and stable flow reduction from high pressure cylinders to clinical applications."
        image_url = "https://images.unsplash.com/photo-1584017911766-d451b3d0e843?w=800&h=600&fit=crop"
        features = @("Brass body chrome plated", "Clear pressure indicators", "Safety relief valve integrated", "Durable neoprene diaphragm")
    },
    @{
        slug = "single-stage-regulator"
        name = "Single Stage Regulator"
        category = "primary-secondary-accessories"
        subcategory = "Medical Gas Accessories"
        description = "Compact single-stage pressure regulator designed for primary reduction of medical gases from bulk storage or cylinders."
        image_url = "https://images.unsplash.com/photo-1581092918056-0c4c3acd3789?w=800&h=600&fit=crop"
        features = @("Extremely compact envelope", "Teflon encapsulation seat", "Easy pressure setting dial", "Built-in line inlet filter")
    },
    @{
        slug = "multi-stage-regulator"
        name = "Multi Stage Regulator"
        category = "primary-secondary-accessories"
        subcategory = "Medical Gas Accessories"
        description = "Ultra-precise dual-stage regulator offering highly stable output pressure even as input cylinder pressure drops."
        image_url = "https://images.unsplash.com/photo-1603126857599-f6e157fa2fe6?w=800&h=600&fit=crop"
        features = @("Precision dual stage design", "Constant pressure discharge", "Sintered metal inlet filter", "Approved for high pressure medical O2")
    }
)

foreach ($product in $products) {
    $slug = $product.slug
    $name = $product.name
    $description = $product.description
    $imageUrl = $product.image_url
    $subcategory = $product.subcategory
    
    $primaryCategory = ""
    if ($product.category -eq "medical-gases-system") {
        $primaryCategory = "Medical Gases System"
    } else {
        $primaryCategory = "Primary & Secondary Accessories"
    }
    
    $featuresHtml = ""
    foreach ($feature in $product.features) {
        $featuresHtml += "<li style='padding: 0.5rem 0; color: #475569; font-size: 0.95rem;'><i class='fas fa-check' style='color: #10b981; margin-right: 0.75rem;'></i>$feature</li>"
    }

    # Generate page content
    $htmlContent = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$name - Medi Teck Engineering</title>
    <meta name="description" content="$description">
    <link rel="stylesheet" href="../styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .detail-section {
            padding: 5rem 0;
            background: #f8fafc;
        }
        .detail-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 4rem;
            align-items: start;
        }
        .detail-image {
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            border: 1px solid #e2e8f0;
        }
        .detail-image img {
            width: 100%;
            height: auto;
            display: block;
            transition: transform 0.5s ease;
        }
        .detail-image:hover img {
            transform: scale(1.05);
        }
        .detail-info {
            padding: 1rem 0;
        }
        .breadcrumbs {
            display: flex;
            gap: 0.5rem;
            font-size: 0.875rem;
            color: #64748b;
            margin-bottom: 1.5rem;
            flex-wrap: wrap;
        }
        .breadcrumbs a {
            color: #2D89C7;
            text-decoration: none;
            font-weight: 500;
        }
        .breadcrumbs a:hover {
            text-decoration: underline;
        }
        .detail-badge {
            display: inline-block;
            padding: 0.4rem 1rem;
            background: rgba(45, 137, 199, 0.1);
            color: #2D89C7;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 600;
            margin-bottom: 1rem;
        }
        .detail-title {
            font-size: 2.5rem;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 1.5rem;
            line-height: 1.2;
        }
        .detail-description {
            font-size: 1.1rem;
            line-height: 1.8;
            color: #475569;
            margin-bottom: 2rem;
        }
        .detail-features-title {
            font-size: 1.25rem;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 1rem;
            border-bottom: 2px solid #e2e8f0;
            padding-bottom: 0.5rem;
        }
        .detail-features-list {
            list-style: none;
            padding: 0;
            margin-bottom: 2.5rem;
        }
        .detail-cta-container {
            display: flex;
            gap: 1.5rem;
            flex-wrap: wrap;
        }
        .cta-btn {
            display: inline-flex;
            align-items: center;
            gap: 0.75rem;
            padding: 1rem 2rem;
            border-radius: 8px;
            font-weight: 600;
            font-size: 1.05rem;
            text-decoration: none;
            transition: all 0.3s;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .cta-whatsapp {
            background: #25D366;
            color: white;
        }
        .cta-whatsapp:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(37, 211, 102, 0.3);
        }
        .cta-quote {
            background: linear-gradient(135deg, #2D89C7 0%, #1a6ba3 100%);
            color: white;
        }
        .cta-quote:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(45, 137, 199, 0.3);
        }
        
        @media (max-width: 968px) {
            .detail-grid {
                grid-template-columns: 1fr;
                gap: 2.5rem;
            }
            .detail-title {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar">
        <div class="container">
            <div class="nav-wrapper">
                <div class="logo">
                    <img src="../meditec_logo.png" alt="MT Engineering Logo">
                    <span class="logo-text">MT Engineering</span>
                </div>
                <ul class="nav-links">
                    <li><a href="../index.html" class="nav-link">Home</a></li>
                    <li><a href="../services.html" class="nav-link">Services</a></li>
                    <li><a href="../products.html" class="nav-link active">Products</a></li>
                    <li><a href="../about.html" class="nav-link">About Us</a></li>
                    <li><a href="../contact.html" class="nav-link">Contact</a></li>
                </ul>
                <div class="mobile-menu-btn">
                    <i class="fas fa-bars"></i>
                </div>
            </div>
        </div>
    </nav>

    <!-- Breadcrumb Hero -->
    <section style="background: linear-gradient(135deg, rgba(45, 137, 199, 0.9) 0%, rgba(26, 107, 163, 0.9) 100%), url('https://images.unsplash.com/photo-1576091160550-2173dba999ef?w=1920&h=400&fit=crop') center/cover; padding: 4rem 0; color: white;">
        <div class="container">
            <h2 style="font-size: 2rem; font-weight: 800; margin-bottom: 0.5rem;">$name</h2>
            <div style="display: flex; gap: 0.5rem; font-size: 0.9rem; opacity: 0.9;">
                <a href="../index.html" style="color: white; text-decoration: none;">Home</a> &gt; 
                <a href="../products.html" style="color: white; text-decoration: none;">Products</a> &gt; 
                <span>$subcategory</span>
            </div>
        </div>
    </section>

    <!-- Detail Section -->
    <section class="detail-section">
        <div class="container">
            <div class="detail-grid">
                <!-- Product Image -->
                <div class="detail-image">
                    <img src="$imageUrl" alt="$name" onerror="this.src='https://via.placeholder.com/600x400?text=No+Image'">
                </div>

                <!-- Product Info -->
                <div class="detail-info">
                    <span class="detail-badge">$primaryCategory</span>
                    <span class="detail-badge" style="background: rgba(16, 185, 129, 0.1); color: #10b981; margin-left: 0.5rem;">$subcategory</span>
                    <h1 class="detail-title">$name</h1>
                    <p class="detail-description">$description</p>
                    
                    <h3 class="detail-features-title">Technical Specifications & Features</h3>
                    <ul class="detail-features-list">
                        $featuresHtml
                    </ul>

                    <div class="detail-cta-container">
                        <a href="https://wa.me/923212999899?text=Hi!%20I'm%20interested%20in%20the%20$([System.Uri]::EscapeDataString($name))" class="cta-btn cta-whatsapp" target="_blank">
                            <i class="fab fa-whatsapp"></i> Inquiry via WhatsApp
                        </a>
                        <a href="../contact.html" class="cta-btn cta-quote">
                            <i class="fas fa-file-invoice"></i> Request Catalog
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-logo">
                    <span class="logo-text">MT Engineering</span>
                    <p>Professional Medical Engineering Solutions</p>
                </div>
                <div class="social-links">
                    <a href="#" class="social-link"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social-link"><i class="fab fa-linkedin-in"></i></a>
                    <a href="https://wa.me/923212999899" class="social-link" target="_blank"><i class="fab fa-whatsapp"></i></a>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2026 Medi Teck Engineering. All Rights Reserved.</p>
            </div>
        </div>
    </footer>

    <!-- Scroll to Top Button -->
    <button class="scroll-top" id="scrollTop">
        <i class="fas fa-arrow-up"></i>
    </button>

    <script src="../script.js"></script>
    <script>
        // Simple scroll to top button script
        const scrollTopBtn = document.getElementById('scrollTop');
        window.addEventListener('scroll', () => {
            if (window.pageYOffset > 300) {
                scrollTopBtn.classList.add('visible');
            } else {
                scrollTopBtn.classList.remove('visible');
            }
        });
        scrollTopBtn.addEventListener('click', () => {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });
    </script>
</body>
</html>
"@

    # Save physical HTML file
    $targetPath = Join-Path $productsDir "$slug.html"
    $htmlContent | Out-File -FilePath $targetPath -Encoding utf8 -Force
    Write-Host "Generated: products/$slug.html"
}

Write-Host "Success: Generated 28 physical product detail pages!"
