use actix_web::{get, web, App, HttpResponse, HttpServer, Responder};
use serde::Serialize;

#[derive(Serialize)]
struct ServiceResponse {
    service: String,
    status: String,
}

#[derive(Serialize)]
struct HealthResponse {
    status: String,
}

#[get("/")]
async fn home() -> impl Responder {
    HttpResponse::Ok().json(ServiceResponse {
        service: "rust-actix".to_string(),
        status: "running".to_string(),
    })
}

#[get("/health")]
async fn health() -> impl Responder {
    HttpResponse::Ok().json(HealthResponse {
        status: "healthy".to_string(),
    })
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .service(home)
            .service(health)
    })
    .bind("0.0.0.0:8080")?
    .run()
    .await
}
