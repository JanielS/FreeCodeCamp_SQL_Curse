#!/bin/bash

PSQL="psql --username=postgres --dbname=salon --tuples-only -c"


# Função para listar os serviços
list_services() {
  echo "Services available:"
  SERVICES=$($PSQL "SELECT service_id, name FROM services")
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
}

# Função para agendar uma consulta
schedule_appointment() {
  list_services
  echo -e "\nPlease select a service (enter the number):"
  read SERVICE_ID_SELECTED

  # Validando a seleção de serviço
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_NAME ]]
  then
    echo "Invalid service. Please try again."
    schedule_appointment
  else
    echo -e "\nEnter your phone number:"
    read CUSTOMER_PHONE

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    
    # Se o cliente não existe, pedir o nome e adicionar ao banco de dados
    if [[ -z $CUSTOMER_ID ]]
    then
      echo -e "\nYou are not in our records. Please enter your name:"
      read CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    else
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    fi

    echo -e "\nEnter the time for your appointment:"
    read SERVICE_TIME

    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    
    if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
    then
      echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -E 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')."
    fi
  fi
}

# Iniciando o agendamento
schedule_appointment