// src/api/axios.js
import axios from "axios";

const api = axios.create({
  baseURL: "http://localhost:8080", // 백엔드 주소
  withCredentials: true,            // ✅ 쿠키(JSESSIONID) 전송 허용
});

export default api;
