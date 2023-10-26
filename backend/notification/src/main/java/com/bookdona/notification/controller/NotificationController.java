package com.bookdona.notification.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/api/notifications")
@RequiredArgsConstructor
public class NotificationController {

	@GetMapping("/get")
	public String getNotifications() {
		return "notifications";
	}

}
