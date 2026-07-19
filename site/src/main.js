import './style.css';

const tickRoot = document.querySelector('[data-dial-ticks]');

if (tickRoot) {
  for (let index = 0; index < 48; index += 1) {
    const tick = document.createElement('span');
    tick.style.setProperty('--tick-index', index);
    tick.classList.toggle('is-signal', index >= 3 && index <= 9);
    tickRoot.append(tick);
  }
}
