export default class extends Controller {
  connect(){
    this.modal = new bootstrap.Modal(this.element)
    this.modal.show();
  }

  disconnect(){
    this.modal.hide();
  }
}
