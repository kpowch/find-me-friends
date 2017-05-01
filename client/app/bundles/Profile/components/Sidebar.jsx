import React from 'react';
import ReactDOM from 'react-dom';

console.log('this is a sidebar')

class Sidebar extends React.Component {

  render() {
    return (
        <div className="sidebar">
          <div className="sidebar-name">
            <i className="fa fa-user-o fa-2x" aria-hidden="true"></i>
            {this.props.first_name} {this.props.last_name}
          </div>
          <div className="sidebar-bio">
            Bio: {this.props.bio}
          </div>
          <div className="sidebar-email">
            {this.props.email}
          </div>
        </div>
    );
  }
}

export default Sidebar;