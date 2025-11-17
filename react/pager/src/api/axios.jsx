// src/api/axios.js
import axios from "axios";

const api = axios.create({
  baseURL: "http://13.62.76.215:8080", // 백엔드 주소
  withCredentials: true,            // ✅ 쿠키(JSESSIONID) 전송 허용
});

export default api;
