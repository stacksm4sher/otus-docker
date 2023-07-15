package ru.otus.home.work.docker.controller;import org.springframework.http.ResponseEntity;import org.springframework.web.bind.annotation.GetMapping;import org.springframework.web.bind.annotation.RestController;import static ru.otus.home.work.docker.controller.HealthController.StatusDto.OK;@RestController public class HealthController { @GetMapping("/health") public ResponseEntity<HealthResponseDto> health() {return ResponseEntity.ok(new HealthResponseDto(OK));}public record HealthResponseDto(StatusDto status) {}public enum StatusDto {OK}}