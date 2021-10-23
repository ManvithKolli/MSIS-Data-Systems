const Assignment = {
    data() {
      return {

        "assignment":[]
      }
    },
    computed: {
        
    },
    methods: {
        fetchAssignmentData() {
            fetch('/api/assignment/')
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
  
Vue.createApp(Assignment).mount('#assignment');