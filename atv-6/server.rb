require 'socket' 

server = TCPServer.open(3001)  # Abre socket em escuta na porta 3001  
loop { # o servidor nunca morre, fica sempre executando
  client = server.accept      # aceita conexão do cliente
  msg_client = client.recvfrom( 10000 ) # recebe mensagem - 10000 bytes - do cliente

  client_resp = msg_client[0].to_i
  client.puts "Valor final com gorjeta de 10%: R$#{client_resp+((10*client_resp)/100)}"
  client.close # fecha conexão
}