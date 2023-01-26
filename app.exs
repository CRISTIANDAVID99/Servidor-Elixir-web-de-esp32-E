defmodule EspServer  do
  use GenServer
  def get(pid, path) do
    GenServer.call(pid, {:get, path})
  end
  def init(param) do
    IO.puts "Se inicia el genserver"
    IO.inspect param
    # {:ok, %{conteo: 0}}

    #{:stop, "la base datos no se ha conectado"}
    :ignore
  end

  def handle_info(message, %{conteo: conteo}) do
    IO.puts " me llega el mensaje #{message}"
    IO.puts "llamado: #{conteo}"
    {:noreply, %{conteo: conteo + 1}}
  end

  def handle_call({:get, path}, from, %{conteo: conteo}) do
    dir = path
    {:reply, dir, %{conteo: conteo + 1}}
  end

  def handle_call({:post, path, value}, from, %{conteo: conteo}) do
    dir = path
    {:reply, dir, %{conteo: conteo + 1}}
  end

  def handle_cast(:reset, _state) do
    IO.puts "handle de reset"
    {:noreply, %{conteo: 0}}
  end


end
