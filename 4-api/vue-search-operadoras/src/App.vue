<template>
  <div id="app">
    <h1>Busca de Operadoras</h1>
    
    <input v-model="query" @input="fetchOperadoras" placeholder="Digite o nome ou registro da operadora" />
    
    <div v-if="loading">Carregando...</div>
    
    <table v-if="operadoras.length > 0">
      <thead>
        <tr>
          <th>Registro ANS</th>
          <th>Nome</th>
          <th>UF</th>
          <th>Data de Cadastro</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="operadora in operadoras" :key="operadora.registro_ans">
          <td>{{ operadora.registro_ans }}</td>
          <td>{{ operadora.nome }}</td>
          <td>{{ operadora.uf }}</td>
          <td>{{ operadora.data_cadastro }}</td>
        </tr>
      </tbody>
    </table>
    
    <div v-if="operadoras.length === 0 && !loading">Nenhuma operadora encontrada.</div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'App',
  data() {
    return {
      query: '',
      operadoras: [],
      loading: false,
    };
  },
  methods: {
    async fetchOperadoras() {
      this.loading = true;
      try {
        const response = await axios.get(`http://localhost:5000/search?query=${this.query}`);
        this.operadoras = response.data;
      } catch (error) {
        console.error("Erro ao buscar operadoras:", error);
      } finally {
        this.loading = false;
      }
    }
  }
};
</script>

<style>
</style>
