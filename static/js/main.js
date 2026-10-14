/**
 * Sistema de Triaje Clínico - JavaScript Main File
 * Functionality and interactivity
 */

// Initialize when DOM is ready
document.addEventListener('DOMContentLoaded', function() {
    initializeApp();
});

/**
 * Initialize application components
 */
function initializeApp() {
    // Initialize Feather Icons
    if (typeof feather !== 'undefined') {
        feather.replace();
    }
    
    // Initialize form validation
    initFormValidation();
    
    // Initialize mobile navigation menu
    initMobileMenu();
    
    // Initialize auto-hide messages
    initMessageAutoHide();
    
    // Initialize real-time updates if on dashboard
    if (document.getElementById('queue-body')) {
        initQueueUpdates();
    }
}

/**
 * Form validation
 */
function initFormValidation() {
    const forms = document.querySelectorAll('form');
    
    forms.forEach(form => {
        form.addEventListener('submit', function(e) {
            const requiredFields = form.querySelectorAll('[required]');
            let isValid = true;
            
            requiredFields.forEach(field => {
                if (!field.value.trim()) {
                    isValid = false;
                    field.classList.add('error');
                    showFieldError(field, 'Este campo es obligatorio');
                } else {
                    field.classList.remove('error');
                    clearFieldError(field);
                }
            });
            
            if (!isValid) {
                e.preventDefault();
            }
        });
    });
    
    // Clear errors on input
    document.querySelectorAll('.form-input, .form-select').forEach(input => {
        input.addEventListener('input', function() {
            this.classList.remove('error');
            clearFieldError(this);
        });
    });
}

/**
 * Show field error message
 */
function showFieldError(field, message) {
    clearFieldError(field);
    
    const errorDiv = document.createElement('div');
    errorDiv.className = 'form-error';
    errorDiv.textContent = message;
    
    field.parentNode.appendChild(errorDiv);
}

/**
 * Clear field error message
 */
function clearFieldError(field) {
    const errorDiv = field.parentNode.querySelector('.form-error');
    if (errorDiv) {
        errorDiv.remove();
    }
}

/**
 * Auto-hide flash messages after 5 seconds
 */
function initMessageAutoHide() {
    const messagesContainer = document.getElementById('messages');
    
    if (messagesContainer) {
        setTimeout(() => {
            messagesContainer.style.transition = 'opacity 0.3s ease';
            messagesContainer.style.opacity = '0';
            
            setTimeout(() => {
                messagesContainer.remove();
            }, 300);
        }, 5000);
    }
}

/**
 * Real-time queue updates
 */
function initQueueUpdates() {
    // Update every 30 seconds
    setInterval(updateQueueData, 30000);
}

/**
 * Fetch and update queue data
 */
function updateQueueData() {
    fetch('/api/queue/')
        .then(response => response.json())
        .then(data => {
            // Update count badge
            const countBadge = document.querySelector('.queue-count');
            if (countBadge) {
                countBadge.textContent = data.total + ' pacientes';
            }
            
            // Update statistics if present
            updateStatistics(data);
        })
        .catch(error => {
            console.log('Error fetching queue updates:', error);
        });
}

/**
 * Update statistics cards
 */
function updateStatistics(data) {
    // This could be enhanced to update stat cards dynamically
    // For now, we just update the count
}

/**
 * Confirmation dialog for dangerous actions
 */
function confirmAction(message) {
    return confirm(message);
}

/**
 * Format date for display
 */
function formatDate(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString('es-BO', {
        day: '2-digit',
        month: '2-digit',
        year: 'numeric',
        hour: '2-digit',
        minute: '2-digit'
    });
}

/**
 * Calculate time elapsed
 */
function timeElapsed(startTime) {
    const now = new Date();
    const start = new Date(startTime);
    const diff = now - start;
    
    const hours = Math.floor(diff / (1000 * 60 * 60));
    const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
    
    return `${hours}h ${minutes}m`;
}

/**
 * Print patient record
 */
function printPatientRecord() {
    window.print();
}

/**
 * Export to PDF (basic implementation)
 */
function exportToPDF() {
    window.print();
}

/**
 * Initialize responsive mobile menu with backdrop and outside-click support
 */
function initMobileMenu() {
    const mobileMenuBtn = document.getElementById('mobileMenuBtn');
    const navMenu = document.getElementById('navMenu');
    
    if (!mobileMenuBtn || !navMenu) return;

    function openMenu() {
        navMenu.classList.add('active');
        mobileMenuBtn.setAttribute('aria-expanded', 'true');
        mobileMenuBtn.classList.add('is-active');
        const iconMenu = mobileMenuBtn.querySelector('.icon-menu');
        const iconClose = mobileMenuBtn.querySelector('.icon-close');
        if (iconMenu && iconClose) {
            iconMenu.style.display = 'none';
            iconClose.style.display = 'block';
        }
    }

    function closeMenu() {
        navMenu.classList.remove('active');
        mobileMenuBtn.setAttribute('aria-expanded', 'false');
        mobileMenuBtn.classList.remove('is-active');
        const iconMenu = mobileMenuBtn.querySelector('.icon-menu');
        const iconClose = mobileMenuBtn.querySelector('.icon-close');
        if (iconMenu && iconClose) {
            iconMenu.style.display = 'block';
            iconClose.style.display = 'none';
        }
    }

    mobileMenuBtn.addEventListener('click', function(e) {
        e.stopPropagation();
        if (navMenu.classList.contains('active')) {
            closeMenu();
        } else {
            openMenu();
        }
    });

    // Close on click outside
    document.addEventListener('click', function(e) {
        if (navMenu.classList.contains('active')) {
            if (!navMenu.contains(e.target) && !mobileMenuBtn.contains(e.target)) {
                closeMenu();
            }
        }
    });

    // Close on escape key
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape' && navMenu.classList.contains('active')) {
            closeMenu();
        }
    });

    // Close when clicking any nav link
    navMenu.querySelectorAll('.nav-link').forEach(link => {
        link.addEventListener('click', function() {
            closeMenu();
        });
    });

    // Auto-close when resizing to desktop
    window.addEventListener('resize', function() {
        if (window.innerWidth > 1024 && navMenu.classList.contains('active')) {
            closeMenu();
        }
    });
}

/**
 * Show loading spinner
 */
function showLoading(element) {
    element.classList.add('loading');
    element.disabled = true;
}

/**
 * Hide loading spinner
 */
function hideLoading(element) {
    element.classList.remove('loading');
    element.disabled = false;
}

// Utility functions
const utils = {
    debounce: function(func, wait) {
        let timeout;
        return function executedFunction(...args) {
            const later = () => {
                clearTimeout(timeout);
                func(...args);
            };
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
        };
    },
    
    throttle: function(func, limit) {
        let inThrottle;
        return function(...args) {
            if (!inThrottle) {
                func.apply(this, args);
                inThrottle = true;
                setTimeout(() => inThrottle = false, limit);
            }
        };
    }
};
