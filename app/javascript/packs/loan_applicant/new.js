$( document ).on('turbolinks:load', function( ) {
  
  $('#loan_applicant_cnpj').mask('00.000.000/0000-00')
  
  $('#loan_applicant_company_name').on('keyup',function(){
    $('#company-name-prev').text($(this).val())
  })
  
  $('#loan_applicant_cnpj').on('keyup',function(){
    $('#cnpj-prev').text($(this).val())
  })
})
