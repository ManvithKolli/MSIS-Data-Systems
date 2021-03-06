const App = {
    data() {
      return {

        "referee":[]
      }
    },
    computed: {
        
    },
    methods: {
        fetchRefereeData() {
            fetch('/api/referees/')
            .then( response => response.json() )
            .then( (responseJson) => {
                console.log(responseJson);
                this.referee = responseJson;
            })
            .catch( (err) => {
                console.error(err);
            })
        }
    },
    created() {
        this.fetchRefereeData();
    } 
} 
  
Vue.createApp(App).mount('#App');