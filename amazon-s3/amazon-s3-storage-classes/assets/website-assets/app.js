(function () {
  const year = document.getElementById("year");
  if (year) year.textContent = String(new Date().getFullYear());

  const chips = Array.from(document.querySelectorAll("[data-filter]"));
  const products = Array.from(document.querySelectorAll(".product"));

  function setActiveChip(active) {
    chips.forEach((c) => c.classList.toggle("active", c === active));
  }

  function applyFilter(filter) {
    products.forEach((p) => {
      const category = p.getAttribute("data-category");
      const show = filter === "all" || category === filter;
      p.style.display = show ? "" : "none";
    });
  }

  chips.forEach((chip) => {
    chip.addEventListener("click", () => {
      const filter = chip.getAttribute("data-filter") || "all";
      setActiveChip(chip);
      applyFilter(filter);
    });
  });

  const form = document.getElementById("contactForm");
  const status = document.getElementById("formStatus");
  if (form && status) {
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      status.textContent = "Sent (demo). In a real lab, wire this to API Gateway + Lambda.";
      form.reset();
      setTimeout(() => (status.textContent = ""), 5000);
    });
  }
})();

