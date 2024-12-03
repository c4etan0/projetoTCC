const cancelar = document.querySelector("#cancelar");
const modal = document.querySelector("#modal");
const modalAddPosition = document.querySelector("#modal-add-position");
const modalForm = document.querySelector("#modal form");
const text_h3 = document.querySelector("#content-delete h3");
const cancel_x = document.querySelector("#cancelar-x a");
const plus_position = document.querySelector("#page_position a");

if (cancelar !== null) {
  cancelar.addEventListener("click", () => {
    modal.classList.add("hide-modal");
    modal.classList.remove("show-modal");
  });
}

if (cancel_x !== null) {
  cancel_x.addEventListener("click", () => {
    modalAddPosition.classList.add("hide-modal");
    modalAddPosition.classList.remove("show-modal");
  });
}

if (plus_position !== null) {
  plus_position.addEventListener("click", () => {
    modalAddPosition.classList.add("show-modal");
    modalAddPosition.classList.remove("hide-modal");
  });
}

const openDeleteModal = (id, page_title) => {
  modalForm.action = `/pages/deletePage/${id}`;
  text_h3.innerHTML = page_title;
  modal.classList.add("show-modal");
  modal.classList.remove("hide-modal");
};

const openModalDeletePosition = (id, position_name) => {
  modalForm.action = `/position/deletePosition/${id}`;
  text_h3.innerHTML = position_name;
  modal.classList.add("show-modal");
  modal.classList.remove("hide-modal");
};

const active = document.querySelectorAll("#menu-admin ul li a");
const activePage = window.location.pathname;

active.forEach((link) => {
  if (link.href.includes(`${activePage}`)) {
    link.classList.add("active");
  }
});

const clickImage = document.querySelectorAll("#content_image");
const getDataId = document.querySelector("#content_image");
const clickImageSingle = document.querySelector("#image_name");
const getImgName = document.querySelectorAll("#img_name");

clickImage.forEach((img) => {
  img.addEventListener("click", () => {
    img.classList.add("active_color");

    navigator.clipboard.writeText(img.innerText);
  });
});
