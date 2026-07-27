import axios from "axios";

const api = axios.create({
  baseURL: "https://eventify-production-6296.up.railway.app/api",
});

export default api;