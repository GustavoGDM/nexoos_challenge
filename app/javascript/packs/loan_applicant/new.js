count_phones = 1
$( document ).on('turbolinks:load', function( ) {
  
  $('#loan_applicant_cnpj').mask('00.000.000/0000-00')
  .mask('00.000.000/0000-00')
  
  $('#phone-0').mask('(00)00000-0000')

  $('#loan_applicant_company_name').on('keyup',function(){
    $('#company-name-prev').text($(this).val())
  })
  
  $('#loan_applicant_cnpj').on('keyup',function(){
    $('#cnpj-prev').text($(this).val())
  })
  
  $('#add-phones').on('click',function(e){
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
  })
})

function new_cont_phone(){
  return `<div class="input-group mb-3">
    <input class="form-control" type="text" name="loan_applicant[phones][]" id="phone-${count_phones}">
    <div class="input-group-append">
      <button class="btn btn-outline-danger" type="button" id="rm-phones-${count_phones}">Remover</button>
    </div>
  </div>`
}
  