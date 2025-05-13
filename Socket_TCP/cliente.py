import socket as libreria_socket
import time

# definimos clase Servidor
class Cliente:
    def __init__(self, host, port):
        self.host = host
        self.port = port
        self.socket = libreria_socket.socket(libreria_socket.AF_INET, libreria_socket.SOCK_STREAM)
        self.socket.connect((self.host, self.port))
        print(f"Conectado al servidor en {self.host}:{self.port}")
        
# Modificación en el método enviar_datos
    def enviar_datos(self, mensaje):
        """ Envia datos al servidor """
        try:
            self.socket.send(mensaje.encode('utf-8'))
            print(f"Datos enviados: {mensaje}")
        except ConnectionResetError:
            print("Error: El servidor cerró la conexión.")
        except Exception as e:
            print(f"Error al enviar datos: {e}")
            
    def cerrar_conexion(self):
        """ Cierra la conexion """
        self.socket.close()
        print("Conexion cerrada")

if __name__ == "__main__":
    # definimos el host y el puerto
    host = 'localhost'
    port = 12345
    # creamos el cliente
    cliente = Cliente(host, port)
    
    # enviamos datos al servidor
    while True:
        mensaje = input("Ingrese un mensaje para enviar al servidor (o 'salir' para terminar): ")
        if mensaje.lower() == 'salir':
            break
        cliente.enviar_datos(mensaje)
    
    # cerramos la conexion
    cliente.cerrar_conexion()