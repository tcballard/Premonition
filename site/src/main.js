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

const steps = [...document.querySelectorAll('[data-stage-index]')];
const stageName = document.querySelector('[data-stage-name]');
const stageCount = document.querySelector('[data-stage-count]');
const progress = document.querySelector('[data-loop-progress]');

function setActiveStage(step) {
  if (!step) return;

  const index = Number(step.dataset.stageIndex);
  steps.forEach((candidate) => {
    candidate.classList.toggle('is-active', candidate === step);
  });

  if (stageName) stageName.textContent = step.dataset.stage;
  if (stageCount) stageCount.textContent = String(index);
  if (progress) progress.style.setProperty('--progress', `${(index / steps.length) * 100}%`);
}

if ('IntersectionObserver' in window && steps.length) {
  const observer = new IntersectionObserver(
    (entries) => {
      const visible = entries
        .filter((entry) => entry.isIntersecting)
        .sort((left, right) => right.intersectionRatio - left.intersectionRatio)[0];
      if (visible) setActiveStage(visible.target);
    },
    { rootMargin: '-30% 0px -42%', threshold: [0.2, 0.55, 0.85] },
  );

  steps.forEach((step) => observer.observe(step));
  setActiveStage(steps[0]);
}

document.querySelectorAll('a[href^="#"]').forEach((link) => {
  link.addEventListener('click', (event) => {
    const target = document.querySelector(link.getAttribute('href'));
    if (!target) return;
    event.preventDefault();
    target.scrollIntoView({
      behavior: window.matchMedia('(prefers-reduced-motion: reduce)').matches ? 'auto' : 'smooth',
      block: 'start',
    });
    history.replaceState(null, '', link.getAttribute('href'));
  });
});
