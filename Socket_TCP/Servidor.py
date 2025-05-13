""" Socket TCP - Servidor """
""" Los socket son una forma de comunicacion entre procesos, si definimos a un socket como un canal de comunicacion
donde exiten un modelo two tier, el servidor escucha y el cliente es quien inicia la comunicacion. Los datos pueden ser
enviados bajo el protocolo TCP o UDP, en este caso TCP. 

Permite una conexion estable, utilizada en paginas web, correo electronica y aolicaciones clientes/servidores.

"""

import socket as libreria_socket
import time

# definimos clase Servidor
class Servidor:
    def __init__(self, host, port):
        self.host = host
        self.port = port
        self.socket = libreria_socket.socket(libreria_socket.AF_INET, libreria_socket.SOCK_STREAM)
        self.socket.bind((self.host, self.port))
        self.socket.listen(1)  # Definimos el socket para escuchar conexiones entrantes
        print(f"Servidor escuchando en {self.host}:{self.port}")
        
    def aceptar_conexion(self):
        """ Acepta una conexion entrante y devuelve los datos de socket y direccion """
        self.conexion, self.direccion = self.socket.accept()
        print(f"Conexion establecida con {self.direccion}")
        return self.conexion, self.direccion
    
    
    def recibir_datos(self):
        """ Recibe datos del cliente"""
        while True:
            try:
                datos = self.conexion.recv(1024) # Recibe 1024 bytes de datos
                if not datos:
                    print("Finalizacion conexion")
                    break
                print(f"Datos recibidos: {datos.decode('utf-8')}")
            except Exception as e:
                print(f"Error al recivir datos: {e}")
                break
        self.conexion.close()
        print("Conexion cerrada")
        
    def enviar_datos(self, mensaje):
        """ Envia datos al cliente """
        try:
            self.conexion.send(mensaje.encode('utf-8'))
            print(f"Datos enviados: {mensaje}")
        except Exception as e:
            print(f"Error al enviar datos: {e}")            
            
            
    def cerrar_conexion(self):
        """ Cierra la conexion """
        self.socket.close()
        print("Servidor cerrado")   
        
        
if __name__ == "__main__":
    # definimos el host y el puerto
    host = 'localhost'
    port = 12345
    # creamos el servidor
    servidor = Servidor(host, port)
    # aceptamos la conexion
    conexion, direccion = servidor.aceptar_conexion()
    servidor.enviar_datos("Hola cliente, bienvenido al servidor")
    # Se reciben datos del cliente
    servidor.recibir_datos()
    servidor.cerrar_conexion()
    print("Servidor cerrado")
    servidor.socket.close()
    