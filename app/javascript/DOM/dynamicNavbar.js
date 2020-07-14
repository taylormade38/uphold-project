const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.home-navbar');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 550) {
        navbar.classList.remove('navbar-transparent');
      } else {
        navbar.classList.add('navbar-transparent');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
