function get_cep (cep,success){
  let endpoint = `https://viacep.com.br/ws/${cep.replace(/[\.\-]+/g,'')}/json/`
  $.ajax({
      url: endpoint,
      contentType: "application/json",
      success: success
  })
}
export default get_cep
