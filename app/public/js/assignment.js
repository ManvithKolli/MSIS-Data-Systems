const App = {
    data() {
      return {

        "assignment":[]
      }
    },
    computed: {
        
    },
    methods: {
        fetchAssignmentData() {
            fetch('/api/referees/')
            .then( response => response.json() )
            .then( (responseJson) => {
                console.log(responseJson);
                this.assignment = responseJson;
            })
            .catch( (err) => {
                console.error(err);
            })
        }
    },
    created() {
        this.fetchAssignmentData();
    } 
} 
  
Vue.createApp(App).mount('#App');