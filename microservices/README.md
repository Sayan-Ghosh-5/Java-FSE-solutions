# Creating Microservices for Account and Loan

## Scenario
Deploy two independent microservices for account and loan details, running on separate ports.

## Account Microservice
- Port: `8080` (default)
- Endpoint: `/accounts/{number}`
- Response format:
  ```json
  { "number": "00987987973432", "type": "savings", "balance": 234343 }
  ```

## Loan Microservice
- Port: `8081`
- Endpoint: `/loans/{number}`
- Response format:
  ```json
  { "number": "H00987987972342", "type": "car", "loan": 400000, "emi": 3258, "tenure": 18 }
  ```
