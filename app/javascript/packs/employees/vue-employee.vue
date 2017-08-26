<template>
    <v-layout row>
        <v-flex xs12 sm6 offset-sm3>
            <v-card class="mb-2">
                <v-card-title primary-title>
                    <v-container fill-width fluid>
                    <v-layout row wrap>
                        <v-flex xs12 sm8>
                            <h5>{{ employee.fname }} {{ employee.lname }}</h5>
                            <div>{{ employee.position }}</div>
                        </v-flex>
                        <v-flex xs12 sm4>
                            <v-progress-circular :size="75"
                                                 :width="10"
                                                 :value="sumAllocation"
                                                 :rotate="-90"
                                                 class="primary--text">
                                {{ sumAllocation }}
                            </v-progress-circular>
                        </v-flex>
                    </v-layout>
                    </v-container>
                </v-card-title>
                <v-card-actions>
                    <v-btn flat class="orange--text" @click="createAssignment()">Create Assignment</v-btn>
                    <v-btn flat class="orange--text" @click="showAssignments = !showAssignments">Show Assignments</v-btn>
                </v-card-actions>
                <v-card-text v-if="creatingAssignment">
                    <h6>Create Assignment</h6>
                    <new-assignment :employee="employee.id" @addAssignment="addAssignment"></new-assignment>
                </v-card-text>
                <v-card-text v-if="showAssignments">
                    <v-list two-line>
                        <v-list-tile avatar ripple v-for="(assignment, index) in assignments" :key="index">
                            <v-list-tile-content>
                                <v-list-tile-title class="primary--text">{{ assignment.project }}</v-list-tile-title>
                                <v-list-tile-sub-title class="grey--text">
                                    {{ assignment.start_date | formatDate }} to {{ assignment.end_date| formatDate }}
                                </v-list-tile-sub-title>
                                <v-list-tile-sub-title>
                                    {{ assignment.allocation_percentage }}% - {{ assignment.project_frequency }}
                                </v-list-tile-sub-title>
                            </v-list-tile-content>
                            <v-list-tile-action>
                                <v-icon class="grey--text text--lighten-1">create</v-icon>
                            </v-list-tile-action>
                        </v-list-tile>
                    </v-list>
                </v-card-text>
            </v-card>
        </v-flex>
    </v-layout>
</template>

<script>
    import AssignmentNew from '../assignments/vue-assignment-new.vue'
    import VProgressCircular from "vuetify/src/components/progress/VProgressCircular";

    export default {
        data: function() {
            return {
                employee: JSON.parse(this.card),
                assignments: JSON.parse(this.empassignments),
                creatingAssignment: false,
                showAssignments: false
            }
        },
        props: ['card', 'empassignments'],
        mounted() {
            console.log(this.employee + ' created')
            //console.log(this.assignments)
            //console.log(this.sumAllocation(this.assignments))
        },
        methods: {
            createAssignment() {
                console.log('create assignment')
                this.creatingAssignment = !this.creatingAssignment
            },
            addAssignment(assignment) {
                assignment.allocation_percentage = parseInt(assignment.allocation_percentage)
                this.assignments.push(assignment)
                this.creatingAssignment = false
                this.$emit('addsuccess', assignment.project + ' created!')
            }

        },
        computed: {
            sumAllocation() {
                return this.assignments.reduce(function(a, b){
                    return b['allocation_percentage'] == null ? a : a + b['allocation_percentage']
                }, 0)
            }
        },
        components: {
            VProgressCircular,
            'new-assignment' : AssignmentNew
        },
        filters: {
            formatDate: function(date) {
                return date.slice(0, 10)
            }
        }
    }
</script>