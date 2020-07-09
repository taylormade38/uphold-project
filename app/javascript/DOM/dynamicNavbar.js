const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.home-navbar');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 550) {
        navbar.classList.add('navbar-white');
      } else {
        navbar.classList.remove('navbar-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
