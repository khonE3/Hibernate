// ============================================
// Hibernate Cheatsheet - Application Logic
// ============================================

document.addEventListener('DOMContentLoaded', () => {
    initCardToggles();
    initCopyButtons();
    initSearch();
    initScrollSpy();
    initBackToTop();
    initMobileMenu();
    initSmoothScroll();
});

// ---------- Card Toggle ----------
function initCardToggles() {
    document.querySelectorAll('.command-card-header').forEach(header => {
        header.addEventListener('click', () => {
            const card = header.closest('.command-card');
            card.classList.toggle('open');
        });
    });
}

// ---------- Copy to Clipboard ----------
function initCopyButtons() {
    document.querySelectorAll('.code-block-copy').forEach(btn => {
        btn.addEventListener('click', (e) => {
            e.stopPropagation();
            const codeBlock = btn.closest('.code-block');
            const code = codeBlock.querySelector('code');
            const text = code.textContent || code.innerText;

            navigator.clipboard.writeText(text).then(() => {
                btn.classList.add('copied');
                btn.innerHTML = '✓ Copied!';
                setTimeout(() => {
                    btn.classList.remove('copied');
                    btn.innerHTML = '📋 Copy';
                }, 2000);
            }).catch(() => {
                // Fallback
                const textarea = document.createElement('textarea');
                textarea.value = text;
                document.body.appendChild(textarea);
                textarea.select();
                document.execCommand('copy');
                document.body.removeChild(textarea);
                btn.classList.add('copied');
                btn.innerHTML = '✓ Copied!';
                setTimeout(() => {
                    btn.classList.remove('copied');
                    btn.innerHTML = '📋 Copy';
                }, 2000);
            });
        });
    });
}

// ---------- Search Functionality ----------
function initSearch() {
    const searchInput = document.getElementById('sidebarSearch');
    if (!searchInput) return;

    searchInput.addEventListener('input', (e) => {
        const query = e.target.value.toLowerCase().trim();
        const cards = document.querySelectorAll('.command-card');
        const sections = document.querySelectorAll('.section');
        const navLinks = document.querySelectorAll('.nav-link[data-section]');

        if (!query) {
            cards.forEach(c => c.style.display = '');
            sections.forEach(s => s.style.display = '');
            navLinks.forEach(l => l.style.display = '');
            return;
        }

        sections.forEach(section => {
            const sectionCards = section.querySelectorAll('.command-card');
            let hasVisibleCard = false;

            sectionCards.forEach(card => {
                const name = (card.querySelector('.command-card-name')?.textContent || '').toLowerCase();
                const summary = (card.querySelector('.command-card-summary')?.textContent || '').toLowerCase();
                const body = (card.querySelector('.command-card-content')?.textContent || '').toLowerCase();

                if (name.includes(query) || summary.includes(query) || body.includes(query)) {
                    card.style.display = '';
                    hasVisibleCard = true;
                } else {
                    card.style.display = 'none';
                }
            });

            const sectionTitle = (section.querySelector('.section-title')?.textContent || '').toLowerCase();
            if (hasVisibleCard || sectionTitle.includes(query)) {
                section.style.display = '';
                if (sectionTitle.includes(query)) {
                    sectionCards.forEach(c => c.style.display = '');
                }
            } else {
                section.style.display = 'none';
            }
        });

        // Update nav
        navLinks.forEach(link => {
            const sectionId = link.getAttribute('data-section');
            const section = document.getElementById(sectionId);
            if (section) {
                link.style.display = section.style.display === 'none' ? 'none' : '';
            }
        });
    });
}

// ---------- Scroll Spy ----------
function initScrollSpy() {
    const sections = document.querySelectorAll('.section[id]');
    const navLinks = document.querySelectorAll('.nav-link[data-section]');

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const id = entry.target.id;
                navLinks.forEach(link => {
                    link.classList.toggle('active', link.getAttribute('data-section') === id);
                });
            }
        });
    }, {
        rootMargin: '-10% 0px -80% 0px',
        threshold: 0
    });

    sections.forEach(section => observer.observe(section));
}

// ---------- Back to Top ----------
function initBackToTop() {
    const btn = document.getElementById('backToTop');
    if (!btn) return;

    window.addEventListener('scroll', () => {
        btn.classList.toggle('visible', window.scrollY > 400);
    });

    btn.addEventListener('click', () => {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
}

// ---------- Mobile Menu ----------
function initMobileMenu() {
    const toggle = document.getElementById('mobileToggle');
    const sidebar = document.querySelector('.sidebar');
    const overlay = document.querySelector('.sidebar-overlay');

    if (!toggle || !sidebar) return;

    toggle.addEventListener('click', () => {
        sidebar.classList.toggle('open');
        if (overlay) overlay.classList.toggle('active');
    });

    if (overlay) {
        overlay.addEventListener('click', () => {
            sidebar.classList.remove('open');
            overlay.classList.remove('active');
        });
    }

    // Close sidebar on nav link click (mobile)
    document.querySelectorAll('.nav-link').forEach(link => {
        link.addEventListener('click', () => {
            if (window.innerWidth <= 1024) {
                sidebar.classList.remove('open');
                if (overlay) overlay.classList.remove('active');
            }
        });
    });
}

// ---------- Smooth Scroll ----------
function initSmoothScroll() {
    document.querySelectorAll('.nav-link[data-section]').forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            const targetId = link.getAttribute('data-section');
            const target = document.getElementById(targetId);
            if (target) {
                target.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    });
}
