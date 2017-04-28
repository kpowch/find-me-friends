import React from 'react';
import ReactDOM from 'react-dom';

class Friend extends React.Component {

  render() {
    return (
      <div className="friend">
        <h2 className="card-title">Meet</h2>
        <div className="card-name">
          {this.props.first_name}
        </div>
        <div className="card-name">
          {this.props.last_name}
        </div>
        <img className="card-pic" src={this.props.profile_picture}/>
        <div className="card-email">
          {this.props.email}
        </div>
      </div>
    );
  }
}

export default Friend;