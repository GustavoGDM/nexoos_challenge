//API
import CepApi from "packs/api_cep"

var count_phones = 1
$( document ).on('turbolinks:load', function( ) {
  
  $('#loan_applicant_cnpj').mask('00.000.000/0000-00')
  
  $('#phone-0').mask('(00)00000-0000')

  $('#loan_applicant_company_name').on('keyup',function(){
    $('#company-name-prev').text($(this).val())
  })
  
  $('#loan_applicant_cnpj').on('keyup',function(){
    $('#cnpj-prev').text($(this).val())
  })
  
  $('#add-phones').on('click',add_new_phone)
  
  
  $('#add-addresses').trigger('click')
  $('#addresses .remove_fields.dynamic').removeClass('text-danger')
  $('#addresses .remove_fields.dynamic').addClass('text-muted')
  $('#addresses .remove_fields.dynamic').on('click',function(e){
    return false
  })
  set_behavior_input_cep($('.cep'))

  $('#addresses').on('cocoon:after-insert', function(e, added_task) {
    set_behavior_new_address_inputs()
  });

})

function new_cont_phone(){
  return `<div class="input-group mb-3">
    <input class="form-control" type="text" name="loan_applicant[phones][]" id="phone-${count_phones}">
    <div class="input-group-append">
      <button class="btn btn-outline-danger" type="button" id="rm-phones-${count_phones}">Remover</button>
    </div>
  </div>`
}

function add_new_phone(e){
    e.preventDefault()
    if($('#phone-0').val().length == 14 ){
      $('#phones-list').append(new_cont_phone())
      $(`#phone-${count_phones}`).val($('#phone-0').val())
      $('#phone-0').val('')
      $(`#phone-${count_phones}`).mask('(00)00000-0000')
      $(`#rm-phones-${count_phones}`).on('click',function(){
        parent = $(this).parent()
        $(parent).parent().remove()
      })
      count_phones++
    }
}

function set_behavior_input_cep(input){
  input.mask('00000-000')
  input.on('keyup',function(){
    if($(this).val().length == 9 ){
      var self = this
      CepApi($(this).val(),function(result){
        var container = $(self).parent().parent()
        container.find('.state').val(result.uf)
        container.find('.city').val(result.localidade)
        container.find('.street').val(result.logradouro)
        container.find('.number').val()
      })
    }
  })
}

function set_behavior_new_address_inputs(){
  var address_inputs = $('#addresses .nested-fields').last()
  var cep_input = address_inputs.find('.cep')
  set_behavior_input_cep(cep_input)
  
}