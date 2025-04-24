package com.example;

import java.sql.*;
import java.util.*;
import com.sun.net.httpserver.HttpServer;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpExchange;
import java.io.*;
import java.net.InetSocketAddress;
import org.json.JSONObject;

public class SurveyDashboardBackend {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/survey_db";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Sum@1767";

    public static void main(String[] args) throws Exception {
        HttpServer server = HttpServer.create(new InetSocketAddress(8080), 0);
        server.createContext("/api/survey-summary", new SurveySummaryHandler());
        server.setExecutor(null);
        server.start();
        System.out.println("Server started on port 8080");
    }

    static class SurveySummaryHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange exchange) throws IOException {
            exchange.getResponseHeaders().add("Access-Control-Allow-Origin", "*");
            exchange.getResponseHeaders().add("Content-Type", "application/json");

            try {
                Map<String, Map<String, Integer>> summary = getSurveySummary();
                JSONObject jsonResponse = new JSONObject(summary);
                String response = jsonResponse.toString();

                exchange.sendResponseHeaders(200, response.length());
                OutputStream os = exchange.getResponseBody();
                os.write(response.getBytes());
                os.close();
            } catch (Exception e) {
                e.printStackTrace();
                String error = "{\"error\":\"Internal Server Error\"}";
                exchange.sendResponseHeaders(500, error.length());
                OutputStream os = exchange.getResponseBody();
                os.write(error.getBytes());
                os.close();
            }
        }

        private Map<String, Map<String, Integer>> getSurveySummary() throws SQLException {
            Map<String, Map<String, Integer>> summary = new LinkedHashMap<>();
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                String query = "SELECT sq.question_text, r.rating, COUNT(*) as count " +
                              "FROM Responses r " +
                              "JOIN SurveyQuestions sq ON r.question_id = sq.question_id " +
                              "GROUP BY sq.question_text, r.rating";
                stmt = conn.prepareStatement(query);
                rs = stmt.executeQuery();

                while (rs.next()) {
                    String question = rs.getString("question_text");
                    String rating = rs.getString("rating");
                    int count = rs.getInt("count");

                    summary.putIfAbsent(question, new LinkedHashMap<>());
                    summary.get(question).put(rating, count);
                }
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }

            return summary;
        }
    }
}