import React from 'react';
import ReactDOM from 'react-dom';
import Chart from 'chart.js'

export default class InterestMatchChart extends React.Component {

  componentDidMount() {
    let data = {
      labels: [ this.props.match + "% Match", 100 - this.props.match + "% Not Match"],
      datasets: [{
        label: ['%interest match'],
        data: [this.props.match, 100 - this.props.match],
        backgroundColor: ["#FF3B3F", "white"],
        hoverBackgroundColor: ["#ff080d", "white"]
      }]
    };

    let interestChart = new Chart(this.interestChart, {
      type: 'doughnut',
      data: data,
      options: {
        legend: {
          display: false,
        },
        title: {
          display: true,
          text: this.props.match + '% Interest Match'
        },
        animation:{
          animateScale:true
        }
      }
    });
  }

  render() {
    return (
      <div className='interest-chart'>
        <canvas ref={el => this.interestChart = el} />
      </div>
    );
  }
}
